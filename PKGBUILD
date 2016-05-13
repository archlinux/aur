# Maintainer: Fabian Zaremba <fabian at youremail dot eu>
pkgname=imageplay-git
_reponame=ImagePlay
_binary=imageplay
pkgver=6.0.0.r3.g4a81026
pkgrel=2
pkgdesc="ImagePlay is a rapid prototyping application for image processing"
arch=('i686' 'x86_64')
url="http://imageplay.io"
license=('GPL3')
depends=('qt5-base' 'freeimage' 'opencv')
makedepends=('git' 'qtchooser')
provides=('imageplay')
conflicts=('imageplay')
source=("git+https://github.com/cpvrlab/${_reponame}.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/${_reponame}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_reponame}"
  git submodule init
  git submodule update
}

build() {

cd "$srcdir/${_reponame}"
qmake-qt5 -recursive
QT_SELECT=5 make

}

package() {

cd "$srcdir/${_reponame}"
install -D -m644 license.md "${pkgdir}/usr/share/licenses/${_reponame}/license.md"

mkdir "$pkgdir/opt"
cp -ar "$srcdir/${_reponame}/_bin/Release/linux"  "$pkgdir/opt/${_reponame}"

mkdir -p "$pkgdir/usr/bin"
ln -s "/opt/${_reponame}/${_binary}"  "$pkgdir/usr/bin/${_binary}"

}
