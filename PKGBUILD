# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xreader
pkgver=1.4.0
pkgrel=2
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'djvulibre' 'desktop-file-utils'
    'gsettings-desktop-schemas' 'gtk3' 'gtk2' 'libsecret' 'libspectre' 'webkit2gtk')
makedepends=('mate-common' 'yelp-tools')
optdepends=('nemo: nemo extension (must be enabled at compile time)'
    'caja-extensions-common: caja extension (must be enabled at compile time)'
    'gtk3-print-backends: printer support in gtk3 apps'
    'texlive-bin: support for dvi files')
provides=($_pkgname)
conflicts=('xreader-git')
url='https://github.com/linuxmint/xreader'
install=xreader.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('9b2173cb1f3d67aec0472317220b15dd')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --prefix="/usr" \
         --localstatedir="/var" \
         --libexecdir="/usr/lib/${pkgname}" \
        --disable-caja --disable-nemo
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
