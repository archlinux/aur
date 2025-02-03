# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
pkgver=4.3.1
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

depends=(embree3 freetype2 graphite harfbuzz harfbuzz-icu libglvnd libspeechd
    libsquish libtheora libvorbis libwebp libwslay libxcursor libxi
    libxinerama libxrandr mbedtls2 miniupnpc pcre2 dotnet-sdk)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')

source=("${_pkgname}.desktop" 'icon.png' 'LICENSE.txt')
sha256sums=('SKIP' 'SKIP' 'SKIP')

source_x86_64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.1/Redot_v${pkgver}-alpha.1_mono_linux_x86_64.zip")
source_i686=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.1/Redot_v${pkgver}-alpha.1_mono_linux_x86_32.zip")
source_armv7h=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.1/Redot_v${pkgver}-alpha.1_mono_linux_arm32.zip")
source_aarch64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.1/Redot_v${pkgver}-alpha.1_mono_linux_arm64.zip")

sha512sums_x86_64=('fa0490785f94f4cd86ca1632a372655656fc3ec5916ef548e975ff1dda27e7e551e31a888d17ed672bcc6585e211d15853de090e640577d341f45a3374132515')
sha512sums_i686=('899f419ae3d9430c26338e195f87246d883591a3eb2fd643a0d6cf433db0e87121dde484702cdcdaf5942980a2f0e7ce2a7579d0a7058ca8c57e0832e432cd50')
sha512sums_armv7h=('a6d183b3564a39c2a6b438aec90448162f7962f46fbd7379e2ffe0513a4504762bfca9388aa21936648a554b6c577c8bc8298da8e18c5baf755128d8f341eded')
sha512sums_aarch64=('3ed630105949e77420fe29f4f397dc1534a9930c0cb6670a724660e20660a0ea76af71347c6762d0470470e4d5049f5ba90d5cf11789fc48975b4d2d18b3abbd')

package()
{
    mkdir -p "${pkgdir}"/opt/"${_pkgname}"
    mkdir -p "${pkgdir}"/usr/bin/

    cd "${srcdir}" || exit

    unzip Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}".zip -d Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}"
    # Remove duplicate
    rm -rf Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}"/Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}"
    mv Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}"/Redot_v"${pkgver}"-alpha.1_mono_linux."${_arch}" Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}"/redot-mono
    cp -r Redot_v"${pkgver}"-alpha.1_mono_linux_"${_arch}"/* "${pkgdir}"/opt/"${_pkgname}"/

    ln -srf "${pkgdir}"/opt/"${_pkgname}"/redot-mono "${pkgdir}"/usr/bin/"${_pkgname}"

    install -Dm644 "${_pkgname}".desktop "${pkgdir}"/usr/share/applications/"${_pkgname}".desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/Redot.png
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
