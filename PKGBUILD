# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=qupzilla
pkgname=$_pkgname-qtwebkit-git
pkgver=1.8.6.31.gc84751d
pkgrel=1
pkgdesc="Cross-platform Qt web browser. Legacy QtWebKit branch."
arch=("i686" "x86_64")
url="http://www.qupzilla.com"
license=("GPL3" "custom")
makedepends=("git" "qt5-tools")
depends=("qt5-webkit" "qt5-script")
provides=("$_pkgname" "$_pkgname-qt4" "$_pkgname-qt5" "$_pkgname-git" "$_pkgname-qt5-qtwebkit-git")
conflicts=("$_pkgname" "$_pkgname-qt4" "$_pkgname-qt5" "$_pkgname-git" "$_pkgname-qt5-qtwebkit-git")
replaces=("$_pkgname-qt5-qtwebkit-git")
source=("git+https://github.com/QupZilla/qupzilla.git#branch=v1.8")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --always | sed 's/^v//;s/-/./g'
}

build() {
    cd $_pkgname

    export USE_WEBGL="true"
    export KDE_INTEGRATION="true"
    export QUPZILLA_PREFIX="/usr/"

    qmake-qt5
    make clean
    make

}

package() {
    cd $_pkgname
    make INSTALL_ROOT="${pkgdir}" install
    install -D -m644 $srcdir/$_pkgname/COPYRIGHT \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
