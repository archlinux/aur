# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=xss-lock-locked-hint
pkgver=0.3.0.r8.g7b0b4dc
pkgrel=2
pkgdesc="Forked version of xss lock that supports logind's SetLockedHint"
arch=('i686' 'x86_64')
url="https://github.com/xdbob/xss-lock/tree/locked_hint"
license=('MIT')
depends=('xcb-util' 'systemd')
makedepends=('cmake' 'python-docutils' 'git')
optdepends=('bash-completion: for bash completion')
provides=('xss-lock')
conflicts=('xss-lock')
source=("$pkgname::git+https://github.com/xdbob/xss-lock#branch=locked_hint")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
