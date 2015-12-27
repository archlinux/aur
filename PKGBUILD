# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# Change font directories bellow to match yours.
# DeJaVu and GhostScript font directories provided bellow are the default ones.
# Windows font directory provided bellow is set according to the example in Arch Linux Wiki.

_dejavu_font_dir="/usr/share/fonts/TTF"
_gs_font_dir="/usr/share/fonts/Type1"
_windows_font_dir="/usr/share/fonts/WindowsFonts"
_srcname="ImageMagick"
_srcver="6.9.2-10"
pkgname=imagemagick-full-doc
pkgver="$(echo ${_srcver} | tr '-' '_')"
pkgrel=1
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc')
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=('da2f6fba43d69f20ddb11783f13f77782b0b57783dde9cda39c9e5e733c2013c')

build() {
	cd "$_srcname"-"$_srcver"

        ./configure \
                --prefix=/usr \
                --sysconfdir=/etc \
                --enable-static=no \
                --enable-shared=yes \
                --enable-opencl \
                --enable-hdri \
                --enable-hugepages \
                --disable-delegate-build \
                --with-modules \
                --with-quantum-depth=32 \
                --with-magick-plus-plus \
                --with-perl \
                --with-perl-options="INSTALLDIRS=vendor" \
                --with-jemalloc \
                --with-umem \
                --with-bzlib \
                --with-x \
                --with-zlib \
                --with-autotrace \
                --without-dps \
                --with-fftw \
                --with-fpx \
                --with-djvu \
                --with-fontconfig \
                --with-freetype \
                --with-gslib \
                --with-gvc \
                --with-jbig \
                --with-jpeg \
                --with-lcms \
                --with-openjp2 \
                --with-lqr \
                --with-lzma \
                --with-openexr \
                --with-pango \
                --with-png \
                --with-rsvg \
                --with-tiff \
                --with-webp \
                --with-wmf \
                --with-xml \
                --with-dejavu-font-dir="$_dejavu_font_dir" \
                --with-gs-font-dir="$_gs_font_dir" \
                --with-windows-font-dir="$_windows_font_dir"
}

package() {

	cd "$_srcname"-"$_srcver"
	
	make DESTDIR="$pkgdir/" install-data-html
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	
}
