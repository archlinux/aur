# Maintainer: Morten Linderud <morten@linderud.pw>
# Contibutor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
pkgname=xss-lock-git
pkgver=0.3.0.r4.g1e158fb
pkgrel=1
pkgdesc="Use external locker as X screen saver"
arch=('i686' 'x86_64')
url="https://bitbucket.org/raymonad/xss-lock"
license=('MIT')
depends=('xcb-util' 'systemd')
makedepends=('cmake' 'python-docutils' 'git')
optdepends=('bash-completion: for bash completion')
provides=('xss-lock')
conflicts=('xss-lock')
source=("$pkgname::git+https://bitbucket.org/raymonad/${pkgname%-git}.git")
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
