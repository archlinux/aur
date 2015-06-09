# Maintainer: Ner0
# Contributor: Tevin Zhang <mail2tevin {at} gmail {dot} com>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Biru Ionut <biru.ionut at gmail.com>
# Contributor: Andrea Fagiani <andfagiani {at} gmail {dot} com>

# Installation order:  freetype2-ubuntu fontconfig-ubuntu libxft-ubuntu cairo-ubuntu
# Source : https://github.com/bohoomil/fontconfig-ultimate/tree/pkgbuild/03_cairo-iu
# Thanks to bohomil

pkgname=cairo-ubuntu
_name=cairo
pkgver=1.14.2
pkgrel=1
pkgdesc="Cairo vector graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
changelog=CHANGELOG
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman>=0.28.0'
         'glib2' 'mesa' 'libgl' 'lzo')
makedepends=('librsvg' 'gtk2' 'poppler-glib' 'libspectre'
             'gtk-doc' 'valgrind' 'git')
provides=("cairo=$pkgver" 'cairo-ubuntu' 'cairo-xcb')
replaces=('cairo-xcb')
conflicts=('cairo' 'cairo-cleartype' 'cairo-git' 'cairo-gl-git' 'cairo-glitz'
           'cairo-ocaml-git' 'cairo-small')
source=(http://cairographics.org/releases/cairo-$pkgver.tar.xz
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)

prepare(){
  cd $_name-$pkgver

  patch -Np1 -i $srcdir/cairo-respect-fontconfig_pb.patch
  patch -Np1 -i $srcdir/cairo-server-side-gradients.patch
  patch -Np1 -i $srcdir/cairo-webkit-html5-fix.patch
}

build() {
  cd $_name-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-lto \
    --enable-tee \
    --enable-gl \
    --enable-egl \
    --enable-svg \
    --enable-ps \
    --enable-pdf \
    --enable-gobject \
    --enable-gtk-doc

  make
}

check() {
  cd $_name-$pkgver
}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install
}
md5sums=('e1cdfaf1c6c995c4d4c54e07215b0118'
         '080eac1ce1b2fa2beb550555d31d29b8'
         '4ffec1c86085da11bf9f56d6bf88fbdf'
         '6080d20e289f5e75cc013e8f40710aa3')
