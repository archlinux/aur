# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Eran Yahav <eran910@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Alexander Zhuk <zhuk.a.v@gmail.com>
# Contributor: Wiadufa Chen <wiadufachen@gmail.com>

pkgname=wxformbuilder-git
_gitname=wxFormBuilder
pkgver=4.0.0.r6.ga75305af
pkgrel=1
pkgdesc="Designer, GUI builder, and RAD tool For wxWidgets"
arch=('i686' 'x86_64' 'aarch64')
url="https://sourceforge.net/projects/wxformbuilder/"
license=('GPL')
provides=('wxformbuilder')
conflicts=('wxformbuilder' 'wxformbuilder-svn')
depends=('wxwidgets-gtk3' 'boost')
makedepends=('git' 'cmake')
source=("git+https://github.com/wxFormBuilder/wxFormBuilder.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v\([0-9]\)/\1/g'
}

prepare() {
  cd "$srcdir/${_gitname}"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${_gitname}"
  cmake -S . -B _build --install-prefix /usr -DCMAKE_BUILD_TYPE=Release
  cmake --build _build --config Release
}

package() {
  cd "$srcdir/${_gitname}"
  DESTDIR="${pkgdir}" cmake --install _build --config Release
}
