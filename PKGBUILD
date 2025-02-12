# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
pkgver=4.3.1
pkgrel=2
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

source_x86_64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.2/Redot_v${pkgver}-alpha.2_mono_linux_x86_64.zip")
source_i686=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.2/Redot_v${pkgver}-alpha.2_mono_linux_x86_32.zip")
source_armv7h=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.2/Redot_v${pkgver}-alpha.2_mono_linux_arm32.zip")
source_aarch64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-alpha.2/Redot_v${pkgver}-alpha.2_mono_linux_arm64.zip")

sha512sums_x86_64=('5e602e5d280f33d876def1fb5a4a2fa4cda02910ec85b802dccd5bb481d96ea64caab54903f898e0652bc456982e5cca28016a7082ceab461c89918c50a811aa')
sha512sums_i686=('5afe3b448336e732a1bf01d1f8dbb25e7f8359571cc019f9bd4d63d7b1acdbdb03502673b41fbac6ece5dc67abbd8046053cd98d5b8c2408df8770906abdb00d')
sha512sums_armv7h=('10d954904d1b1910e340d0b3ba062686aecc91163b0fc648a72512c2c2a9ff2d4162bff57b6c10a285d7a8673a59188da16e4b4d9188003f5296655493c661e2')
sha512sums_aarch64=('25d903f581fd57ec9db3010c0c453d458e20a228ccd37912facd2fac0fe13f53a02c16700262e204004583e239dc234dde54cbf95663f3f8c131fed502374766')

package()
{
    mkdir -p "${pkgdir}"/opt/"${_pkgname}"
    mkdir -p "${pkgdir}"/usr/bin/

    cd "${srcdir}" || exit

    unzip Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}".zip -d Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}"
    # Remove duplicate
    rm -rf Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}"/Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}"
    mv Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}"/Redot_v"${pkgver}"-alpha.2_mono_linux."${_arch}" Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}"/redot-mono
    cp -r Redot_v"${pkgver}"-alpha.2_mono_linux_"${_arch}"/* "${pkgdir}"/opt/"${_pkgname}"/

    ln -srf "${pkgdir}"/opt/"${_pkgname}"/redot-mono "${pkgdir}"/usr/bin/"${_pkgname}"

    install -Dm644 "${_pkgname}".desktop "${pkgdir}"/usr/share/applications/"${_pkgname}".desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/Redot.png
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
