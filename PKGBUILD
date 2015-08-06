# Maintainer: Fabian Zaremba <fabian at youremail dot eu>
pkgname=imageplay-git
_reponame=ImagePlay
pkgver=6.0.0.beta.3.r8.g1080014
pkgrel=1
pkgdesc="ImagePlay is a rapid prototyping application for image processing"
arch=('i686' 'x86_64')
url="http://imageplay.io"
license=('GPL3')
depends=('qt5-base' 'freeimage' 'opencv')
makedepends=('git' 'qtchooser')
provides=('imageplay')
conflicts=('imageplay')
source=("git://github.com/cpvrlab/${_reponame}")
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
ls
qmake-qt5 -recursive
QT_SELECT=5 make

}

package() {

cd "$srcdir/${_reponame}"
install -D -m644 license.md "${pkgdir}/usr/share/licenses/${_reponame}/license.md"

mkdir "$pkgdir/opt"
cp -ar "$srcdir/${_reponame}/_bin/Release/linux"  "$pkgdir/opt/${_reponame}"

mkdir -p "$pkgdir/usr/bin"
ln -s "/opt/${_reponame}/${_reponame}"  "$pkgdir/usr/bin/${_reponame}"

}
