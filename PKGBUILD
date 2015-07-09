# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=glsl-debugger-git
pkgver=0.r324.72937cf
pkgrel=1
epoch=1
pkgdesc="GLSL source level debugger. This is the Open Source public release of the project originally known as glslDevil."
arch=('i686' 'x86_64')
url="http://glsl-debugger.github.io/"
license=('custom')
depends=('qt4' 'glew' 'freeglut')
makedepends=('git' 'cmake')
source=("$pkgname::git://github.com/GLSL-Debugger/GLSL-Debugger.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

 
build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}
 
package() {
  cd "$srcdir/build"

  #install files manually
  install -dm755 "$pkgdir"/usr/{lib,bin}
  cp -a lib/* "$pkgdir/usr/lib"
  cp -a bin/* "$pkgdir/usr/bin"

  # install license file
  install -Dm644 "$srcdir/$pkgname/LICENSE.TXT" \
	    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
