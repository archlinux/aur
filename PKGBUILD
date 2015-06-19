# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=nxt-git
pkgver=1.5.12.r5.g5bbafe1
pkgrel=1
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency."
arch=('any')
url="http://nxt.org"
license=('MIT/GPL')
depends=('bash' 'java-runtime-openjdk=8')
makedepends=('java-environment-openjdk=8')
optdepends=('flashplugin: for add to clipboard support')
source=("${pkgname}::git+https://bitbucket.org/JeanLucPicard/nxt.git"
  "nxt.service"
  "nxt.install")
sha256sums=('SKIP'
            '293bf1e313677f769e4a12e6e0f78bbd58c796ebe7c34528ba50cd73bbea15a7'
            'b7575397d7dd19e9b1bab75e21a433f3bdc98279ad822fe57235b830c062abca')
install='nxt.install'

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./compile.sh
}

package() {
  # Copy to /opt/nxt
  install -dm755 "$pkgdir/opt/nxt"
  cp -r "${pkgname}"/* "$pkgdir"/opt/nxt/

  # Copy service file
  install -Dm644 nxt.service  "$pkgdir/usr/lib/systemd/system/nxt.service"
}
