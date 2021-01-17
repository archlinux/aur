# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=yarn-completion-git
pkgver=0.17.0.r0.g30262cf
pkgrel=5
pkgdesc='Bash completion for Yarn'
url='https://github.com/dsifford/yarn-completion'
arch=('any')
license=('MIT')
depends=('bash' 'bash-completion' 'yarn')
makedepends=('git')
source=("git+${url}.git" '0001-fix-tests.patch')
sha256sums=('SKIP' 'e00774fa650fb037ae62e0963308baee7509a4bbeea445193684db2c2e8a18d2')

pkgver() {
  cd ${pkgname%-git}
  # using git rev-list to force the latest tag to show up
  git describe --long "$(git rev-list --tags --max-count=1)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd ${pkgname%-git}
  patch -p0 tests/test -i ../0001-fix-tests.patch
}

check() {
  cd ${pkgname%-git}
  bash tests/test
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 "${pkgname%-git}.bash" "$pkgdir/usr/share/bash-completion/completions/yarn"
}
