# Maintainer:  Eden Rose <eenov1988@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eugene Tan <jmingtan at gmail dot com>

pkgname=librocket-git
pkgver=1.2.2
pkgrel=1
pkgdesc="The HTML/CSS User Interface library - No Longer Maintained Upstream; use librocket-asarium-git instead"
arch=('i686' 'x86_64')
url="https://github.com/libRocket/libRocket"
license=('MIT')
depends=('boost' 'freetype2' 'python2' 'libgl' 'glu')
makedepends=('cmake' 'mesa')
conflicts=('librocket')
provides=('librocket' "$pkgname")
source=("$pkgname::git+https://github.com/libRocket/libRocket.git")
sha256sums=('SKIP')

#prepare() {
#  # fix samples folder
#  sed 's|opt/Rocket/Samples|share/librocket/samples|' -i \
#    libRocket-release-$pkgver/Build/CMakeLists.txt
#}

build() {
  cd $pkgname/Build
  cmake -DCMAKE_INSTALL_PREFIX="" -DBUILD_SAMPLES=ON \
    -DBUILD_PYTHON_BINDINGS=ON -DPYTHON_EXECUTABLE=/usr/bin/python2 .
  make
}

package() {
  cd $pkgname
  make -C Build install DESTDIR="$pkgdir/usr"

  # doc
  install -d "$pkgdir"/usr/share/doc/librocket
  install -m644 readme.md changelog.txt "$pkgdir"/usr/share/doc/librocket
  # license
  install -d "$pkgdir"/usr/share/licenses/librocket
  tail -n20 readme.md > "$pkgdir"/usr/share/licenses/librocket/LICENSE.md
}
