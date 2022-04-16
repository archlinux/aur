# Contributor: Kazuki Shigemichi <shigemichik@gmail.com>
# Forked from https://aur.archlinux.org/packages/roswell/
# Contributor: Thayne McCombs <bytecurry.software@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=roswell-git
pkgver=21.10.14.111.r20.g1c8e46d
pkgrel=1
pkgdesc="Lisp installer and launcher"
url="https://github.com/roswell/roswell"
arch=('i686' 'x86_64')
license=('MIT')
depends=('curl')
makedepends=('git')
conflicts=('roswell')
provides=('roswell')
source=("git+https://github.com/jgarte/roswell.git")
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
