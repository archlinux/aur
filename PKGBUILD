# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=qupzilla
pkgname=$_pkgname-qtwebkit-git
pkgver=1.8.9.34.gc59b1f1
pkgrel=2
pkgdesc='Cross-platform Qt web browser. QtWebKit branch.'
arch=('i686' 'x86_64')
url='http://www.qupzilla.com'
license=('GPL3' 'custom')
depends=('qt5-webkit' 'qt5-script' 'qt5-x11extras' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git' 'qt5-tools')
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

    qmake-qt5 CONFIG+=debug
    make

}

package() {
    cd $_pkgname
    make INSTALL_ROOT="${pkgdir}" install
    install -D -m644 $srcdir/$_pkgname/COPYRIGHT \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
