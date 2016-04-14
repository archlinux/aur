# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xreader
pkgver=1.0.1
pkgrel=1
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'djvulibre' 'desktop-file-utils' 'gsettings-desktop-schemas' 'gtk3' 'gtk2' 'libsecret')

# Install appropriate dependency and remove disable switch
# to build extensions
# For caja: caja-extensions-common
# For nemo: nemo
makedepends=('git' 'mate-common')
optdepends=('nemo: nemo extension'
    'caja-extensions-common: caja extension')
provides=($_pkgname)
conflicts=('xreader-git')
url='https://github.com/linuxmint/xreader'
install=xreader.install

source=("https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('f4c0c803e350b76700c00482c432da49')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/xreader" \
        --disable-caja --disable-nemo
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

