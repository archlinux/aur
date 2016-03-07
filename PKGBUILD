# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xreader-git
pkgver=1.0.1.r5.g7173bc0
pkgrel=1
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'djvulibre' 'desktop-file-utils' 'gsettings-desktop-schemas' 'gtk3' 'gtk2' 'libsecret')

# Install appropriate dependency and remove disable switch
# to build extensions
# For caja: caja-extensions-common
# For nemo: nemo
makedepends=('git' 'mate-common')
provides=($_pkgname)
conflicts=('xreader')
url='https://github.com/linuxmint/xreader'
install=xreader.install

source=('xreader-git::git+https://github.com/linuxmint/xreader.git')
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    _DISABLE_EXTENSIONS="--disable-caja --disable-nemo"
    ./autogen.sh --prefix="/usr" $_DISABLE_EXTENSIONS
    make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

