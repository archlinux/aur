# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: gato_lento <vukk.euob at gmail>
# Contributor: Jonas Schwartz
_program_name=GalaxyBudsClient
_pkgname="${_program_name,,}"
pkgname="${_pkgname}-bin"
pkgver=4.5.3
pkgrel=5
pkgdesc="Unofficial manager for the Samsung Galaxy Buds, Buds+, Buds Live and Buds Pro"
arch=('x86_64'
      'armv7h'
      'aarch64')
url="https://github.com/ThePBone/${_program_name}"
license=('GPL3')
depends=('gcc-libs' 'zlib')
options=('!strip')
install="${pkgname}.install"
source=("${_pkgname}.desktop" "icon_white.png")

# regardless of architecture, the url used to download the binary starts with this
_source_url_common="${url}/releases/download/${pkgver}"

# template used for the names of the binaries
_source_binary_common="${_program_name}_Linux_ARCH_Portable.bin"

_source_binary_x86_64="${_source_binary_common/ARCH/amd64}"
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
            '04b551470a2e0ccd99b266d313265321113886f5808b872bf928a97442bf930a')
sha256sums_x86_64=('46e8098f2c084708daed8e89119317043b643017a3ee2f45025d61d13b625345')
sha256sums_armv7h=('051d31e680d09e2a7fe3a317b2dbeaad786ec2c6d7571fa8232d5099d4be2764')
sha256sums_aarch64=('df7eaf63cdd3120ee5b6f49031ef20456ce627740bce995d858fd9ca9d1fe2d6')
