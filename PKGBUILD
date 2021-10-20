# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=gimp
pkgname=${_pkgname}-devel
pkgver=2.99.8
pkgrel=1
pkgdesc="GNU Image Manipulation Program (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://www.gimp.org/"
license=('GPL' 'LGPL')
depends=('gtk3' 'lcms2' 'libwmf' 'icu' 'enchant' 'libgexiv2' 'librsvg' 'desktop-file-utils'
         'libexif' 'openjpeg2' 'poppler-glib' 'poppler-data' 'openexr' 'mypaint-brushes1'
         'babl>=0.1.78' 'gegl>=0.4.32' 'cairo' 'python-gobject' 'appstream-glib' 'libxmu' 'graphviz')
makedepends=('intltool' 'libxslt' 'glib-networking'
             'alsa-lib' 'curl' 'ghostscript' 'libxpm' 'webkit2gtk'
             'libheif' 'libwebp' 'libmng' 'iso-codes' 'aalib' 'zlib' 'libjxl'
             'gjs'  'luajit' 'meson' 'gobject-introspection'
             'gtk-doc' 'xorg-server-xvfb' 'vala')
checkdepends=('xorg-server-xvfb')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'webkit2gtk: HTML renderer and web content engine'
            'libheif: HEIF support'
            'libjxl: JPEG XL support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'iso-codes: Language support'
            'aalib: ASCII art support'
            'zlib: Compression routines'
            'gjs: JavaScript scripting support'
            'luajit: LUA scripting support'
            'lua51-lgi: LUA scripting support')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=(https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2 linux.gpl)
sha256sums=('dd916bd3474ef2efc652a0510280977ab8ea95e3d95d918394b0662261c32aae'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')
build() {
  cd "${_pkgname}-${pkgver}"
    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/gimp \
    --datarootdir=/usr/share \
    --enable-mp \
    --enable-gimp-console \
    --enable-gtk-doc
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.99/palettes/Linux.gpl"
}
