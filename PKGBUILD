# Maintainer: Kazuki Shigemichi <shigemichik@gmail.com>
# Forked from https://aur.archlinux.org/packages/roswell/
# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname="roswell-git"
pkgver="18.3.10.89.r25.ge39397a"
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/roswell/roswell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
makedepends=('git')
conflicts=('roswell')
provides=('roswell')
source=("git+https://github.com/roswell/roswell.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/g;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  install -D COPYING "$pkgdir/usr/share/licenses/roswell/LICENSE"
}
