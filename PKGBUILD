# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Rudolf Olah <omouse@gmail.com>

pkgname=kawa-git
pkgver=3.1.1.r104.ga852d3595
pkgrel=1
pkgdesc="Kawa is a JVM-based Scheme compiler"
url="http://www.gnu.org/software/kawa/"

conflicts=('kawa')
provides=('kawa')
depends=('java-environment')
makedepends=('texinfo' 'git')
arch=('i686' 'x86_64')
license=('X11/MIT')

source=("git+https://gitlab.com/kashell/Kawa.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/Kawa"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/Kawa
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/Kawa
  make DESTDIR=${pkgdir} install
}
