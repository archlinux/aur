# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
_pkgver=4.3.1-beta.1
pkgver=4.3.1_beta.1
pkgrel=1
pkgdesc="A multi-platform 2D and 3D game engine"
url="https://www.redotengine.org/"
license=('MIT')
provides=("$_pkgname")
conflicts=('redot' 'redot-bin' "$_pkgname")

arch=('x86_64' 'i686' 'armv7h' 'aarch64')
_arch='x86_64'

if test "$CARCH" == 'i686'; then
	_arch='x86_32'
elif test "$CARCH" == 'armv7h'; then
	_arch='arm32'
elif test "$CARCH" == 'aarch64'; then
    _arch='arm64'
fi

depends=(
    embree3
    freetype2
    graphite
    harfbuzz
    harfbuzz-icu
    libglvnd
    libspeechd
    libsquish
    libtheora
    libvorbis
    libwebp
    libwslay
    libxcursor
    libxi
    libxinerama
    libxrandr
    mbedtls2
    miniupnpc
    pcre2
    dotnet-sdk
)

optdepends=(
    'pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support'
)

makedepends=(
  7zip
)

source=("${_pkgname}.desktop" 'icon.png' 'LICENSE.txt')
sha256sums=('SKIP' 'SKIP' 'SKIP')

source_x86_64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${_pkgver}/Redot_v${_pkgver}_mono_linux_x86_64.zip")
source_i686=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${_pkgver}/Redot_v${_pkgver}_mono_linux_x86_32.zip")
source_armv7h=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${_pkgver}/Redot_v${_pkgver}_mono_linux_arm32.zip")
source_aarch64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${_pkgver}/Redot_v${_pkgver}_mono_linux_arm64.zip")

sha512sums_x86_64=('98055cfa20a19200aaf06a7a0d1f1ab85a25bd911be68e48e431696b23a1e989d257e20b802d33c01568810f5e7cf311a77afa551e4df438dc8f85fa95bc9db8')
sha512sums_i686=('52b62f4aa96e0feff01fa28a5289be45fb216a100f003d9df66883581854be28d6a49d6008580fdfab079e1a4478f8af82e4f21f7bf4d9183035603e7163f82b')
sha512sums_armv7h=('62f5c14bab919c08c7ebf8ab54634ebb0f8211a21d09ae626230f270d5d01f8803bd0ed3b982b6c23dbc642eb7cdba66ed613ab269c181d4b005ce11d2382aad')
sha512sums_aarch64=('73501e5bd29c24c40dc9a1e779d0f55ea69fc96d8176038c7d7469f5c707a12dbdfbb7dc0b222e7b479dbdf86fc85b49585b12cae381347c90b6c894e93cd2e6')

package()
{
    mkdir -p ${pkgdir}/opt/${_pkgname}
    mkdir -p ${pkgdir}/usr/bin/

    cd ${srcdir} || exit

    7za x Redot_v${_pkgver}_mono_linux_${_arch}.zip -o${_pkgname}

    cp -r ${_pkgname}/Redot_v${_pkgver}_mono_linux_${_arch}/* ${pkgdir}/opt/${_pkgname}/

    # move into directory
    cd ${pkgdir}/opt/${_pkgname}

    # rename executable
    mv Redot_v${_pkgver}_mono_linux.${_arch} ${_pkgname}

    # back to top
    cd ${srcdir}

    ln -srf ${pkgdir}/opt/${_pkgname}/redot-mono ${pkgdir}/usr/bin/${_pkgname}

    install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
