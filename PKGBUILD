pkgname=xss-lock-session
pkgver=0.3.0.r6.gcd0b89d
pkgrel=1
pkgdesc="Forked version of xss lock that allows specifying a session"
arch=('i686' 'x86_64')
url="https://github.com/xdbob/xss-lock"
license=('MIT')
depends=('xcb-util' 'systemd')
makedepends=('cmake' 'python-docutils' 'git')
optdepends=('bash-completion: for bash completion')
provides=('xss-lock')
conflicts=('xss-lock')
source=("$pkgname::git+https://github.com/xdbob/xss-lock.git")
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

# vim:set ts=2 sw=2 et:
