# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xreader-git
_pkgbasename=xreader
pkgver=1.0.8.r0.gb148a44
pkgrel=1
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'djvulibre' 'desktop-file-utils' 'gsettings-desktop-schemas' 'gtk3' 'gtk2' 'libsecret')

makedepends=('git' 'mate-common')
optdepends=('nemo: nemo extension (must be enabled at compile time)'
    'caja-extensions-common: caja extension (must be enabled at compile time)')
provides=($_pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xreader'
install=xreader.install

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    ./autogen.sh --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/${_pkgbasename}" \
        --disable-caja --disable-nemo
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

