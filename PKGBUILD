# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
_pkgver=4.3.1-rc.1
pkgver=4.3.1_rc.1
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

sha512sums_x86_64=('61dd3e7e38cc998c79d6df5e49581dec9b124deedfb5cd94a6313725478515b63c36983743a49fef41fd848376ed2eb927875072448cd98b68202bd1946cf654')
sha512sums_i686=('b935100c6ce93ea5a8ff0e3d73d13acd80e0f24867b09f461197cf30603de99311fc3197e8432e1e1f52c58d179b5f3a8e06b0c6bb6c282f6281c5400b658186')
sha512sums_armv7h=('d2786985b3cc7c6b38fd0349a6fe1d466a33c77a0fbf69cb3f2969e523ac9f2be0834b577f385c7b4996a29667f8b91fc5a2e3cbb023d1f029681b4a62378184')
sha512sums_aarch64=('7585d37e9aa52aafa103e2806c987b8f1c4c724e3c63ae07e7363514ee541ddd96f3e0a3813d99ea4183434680b60d7bedd7bc1079d8c8c19666676947b3b2f3')

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
