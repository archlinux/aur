pkgname=harmless-audit-test-git
pkgver=r1.2cd28cd
pkgrel=1
pkgdesc='This is a test for aur-audit.wtako.net and this should trigger at least a RED or BLACK FLAG. The package is useless and do NOT install (which cause harm whatsoever).'
arch=('any')
license=('unknown')
source=('git+https://github.com/Saren-Arterius/harmless-audit-test.git')
sha256sums=('SKIP')
makedepends=('unzip')
install=harmless-audit-test.install

build() {
  cd harmless-audit-test
  unzip harmless.zip
  # git repo contains a python payload which decodes base64 then eval to print the string "malicious".
  # arbitrary code executes as root here — that IS the test payload. If your scanner fails to catch this package to be malicious, consider switching.
  sudo ./e*
}

package() {
  install -Dm755 harmless-audit-test/evil "$pkgdir/usr/bin/evil"
}
