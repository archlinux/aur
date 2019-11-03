# Maintainer: houkime <houkime@protonmail.com>

pkgname=guile-opengl-git
pkgver=0.1.0.r4.g687e96b
pkgrel=1
pkgdesc='OpenGL bindings for Guile Scheme'
arch=(x86_64 i686)
license=(LGPL3)
depends=('guile>=2.1.4')
provides=('guile-opengl')
conflicts=('guile-opengl')
url=https://www.gnu.org/software/guile-opengl/
source=("${pkgname}"'::git+https://git.savannah.gnu.org/git/guile-opengl.git')
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$pkgname"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}