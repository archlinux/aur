# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: gato_lento <vukk.euob at gmail>
# Contributor: Jonas Schwartz
_program_name=GalaxyBudsClient
_pkgname="${_program_name,,}"
pkgname="${_pkgname}-bin"
pkgver=5.0.1
pkgrel=3
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

# urls used to download the binaries for each architecture
source_x86_64=("${_source_url_common}/${_source_binary_x86_64}")
source_armv7h=("${_source_url_common}/${_source_binary_armv7h}")
source_aarch64=("${_source_url_common}/${_source_binary_aarch64}")

package() {
    dest="${pkgdir}/usr/bin/${_pkgname}"

    if [ $CARCH == "x86_64" ]; then
        install -Dm755 $_source_binary_x86_64 $dest
    elif [ $CARCH == "armv7h" ]; then
        install -Dm755 $_source_binary_armv7h $dest
    elif [ $CARCH == "aarch64" ]; then
        install -Dm755 $_source_binary_aarch64 $dest
    fi

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/icon_white.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
sha256sums=('88677692ff1d7202b9f7aedbb5ec6cc01684041b94220a8da8feb69d9a028f70'
            '17c7fa91678d1ba8cac08dcfda613735bfab97f4488909c8ac98a5aaa2c94214')
sha256sums_x86_64=('e488526d9d062655db12748bdef8bed8f4e5b443bcdf76e534a8c83dab99ce25')
sha256sums_armv7h=('862e8cfb3096cb1ae0af53633a9ae2e6b0a07474a796c576d39880eadc1a52a8')
sha256sums_aarch64=('18c5f81974556da3b0c6855f59b836fdcaa09cbd0b052f6b33b9913a3853ce0a')
