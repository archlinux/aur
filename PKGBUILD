# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
_pkgver=4.4-alpha.2
pkgver=4.4_alpha.2
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

sha256sums_x86_64=('100c43c2ae9fa01875c19868c3f3e78ebf754151df3c2175b7d3eea73922a8ae')
sha256sums_i686=('f259a4c8e520e5c6611958a148939a8d1a2d8376d3e696ca4283b58f1cc6e8e7')
sha256sums_armv7h=('0dc6589aa28a9a55df484977036a17bdb94a5bb59d534664df84c66707d70dce')
sha256sums_aarch64=('dc822562194597cb5fa97d1e879148680feaf4cc06583957705d795f98d068c0')

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
