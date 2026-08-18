# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: gato_lento <vukk.euob at gmail>
# Contributor: Jonas Schwartz
_program_name=GalaxyBudsClient
_pkgname="${_program_name,,}"
pkgname="${_pkgname}-bin"
pkgver=5.2.1
pkgrel=1
pkgdesc="Unofficial manager for the Samsung Galaxy Buds, Buds+, Buds Live and Buds Pro"
arch=('x86_64'
      'armv7h'
      'aarch64')
url="https://github.com/timschneeb/${_program_name}"
license=('GPL3')
depends=('gcc-libs' 'zlib' 'bluez')
options=('!strip')
install="${pkgname}.install"
source=("${_pkgname}.desktop" "icon_white.png")

# regardless of architecture, the url used to download the binary starts with this
_source_url_common="${url}/releases/download/${pkgver}"

# template used for the names of the binaries
_source_binary_common="${_program_name}_Linux_ARCH_Portable.bin"

_source_binary_x86_64="${_source_binary_common/ARCH/64bit}"
_source_binary_armv7h="${_source_binary_common/ARCH/arm}"
_source_binary_aarch64="${_source_binary_common/ARCH/arm64}"

# Attach version to the source file names to have unique binary names per version
_local_binary_x86_64="${_source_binary_x86_64/.bin/-${pkgver}}.bin"
_local_binary_armv7h4="${_source_binary_armv7h/.bin/-${pkgver}}.bin"
_local_binary_aarch64="${_source_binary_aarch64/.bin/-${pkgver}}.bin"

# urls used to download the binaries for each architecture
source_x86_64=("$_local_binary_x86_64::${_source_url_common}/${_source_binary_x86_64}")
source_armv7h=("$_local_binary_armv7h4::${_source_url_common}/${_source_binary_armv7h}")
source_aarch64=("$_local_binary_aarch64::${_source_url_common}/${_source_binary_aarch64}")

package() {
    dest="${pkgdir}/usr/bin/${_pkgname}"

    if [ $CARCH == "x86_64" ]; then
        install -Dm755 $_local_binary_x86_64 $dest
    elif [ $CARCH == "armv7h" ]; then
        install -Dm755 $_local_binary_armv7h4 $dest
    elif [ $CARCH == "aarch64" ]; then
        install -Dm755 $_local_binary_aarch64 $dest
    fi

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/icon_white.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
sha256sums=('88677692ff1d7202b9f7aedbb5ec6cc01684041b94220a8da8feb69d9a028f70'
            '17c7fa91678d1ba8cac08dcfda613735bfab97f4488909c8ac98a5aaa2c94214')
sha256sums_x86_64=('fa3b0889c2142821f10a2df2b359c7573106c2e0559c9465dd32d983ef1f9ae3')
sha256sums_armv7h=('14e221110d64082dc44200f78edb98887aa91c0adf81f54a2158a3f1f5a0b0bd')
sha256sums_aarch64=('b3d8279ed888f05aeacd8aa7318c8635e4b1ae5ad44ffe3a0b5c55b43681ef0b')
