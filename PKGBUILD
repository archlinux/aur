# Maintainer: Wasabi <wasabithumbs@gmail.com>
_name="alpemix"
pkgname="${_name}-bin"
pkgver="1.6.0"
pkgrel=1
pkgdesc="Free remote desktop program"
arch=('x86_64' 'i686')
url='https://www.alpemix.com/en/Linux'
license=('custom')
depends=('glibc' 'lib32-gcc-libs' 'zlib')
provides=("${_name}=${pkgver}")
makedepends=('unzip')
_zip="Alpemix.zip"
source=("https://www.alpemix.com/site/linux/${_zip}" "${_name}.desktop" "icons.zip")
md5sums=("310efc91c7ac9cfc8172de8fb3f6ec67" "SKIP" "SKIP")
options=(!strip)

prepare() {
    cd $srcdir
    unzip -o "Alpemix.zip"
    chmod +rw "Alpemix"
    unzip -o "icons.zip"
}

# build() {
# }

package() {
	install -Dm644 "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
	cp "${srcdir}/16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_name}.png"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
	cp "${srcdir}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_name}.png"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
	cp "${srcdir}/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_name}.png"

	install -Dm755 "${srcdir}/Alpemix" "${pkgdir}/usr/bin/alpemix"
} 
