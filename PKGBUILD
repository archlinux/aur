# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
pkgver=4.3
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
    libxinerama libxrandr mbedtls2 miniupnpc pcre2)
optdepends=('pipewire-alsa: for audio support'
    'pipewire-pulse: for audio support')

source=("${_pkgname}.desktop" 'icon.png' 'LICENSE.txt')
sha256sums=('SKIP' 'SKIP' 'SKIP')

source_x86_64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-stable/Redot_v${pkgver}-stable_mono_linux_x86_64.zip")
source_i686=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-stable/Redot_v${pkgver}-stable_mono_linux_x86_32.zip")
source_armv7h=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-stable/Redot_v${pkgver}-stable_mono_linux_arm32.zip")
source_aarch64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${pkgver}-stable/Redot_v${pkgver}-stable_mono_linux_arm64.zip")

sha512sums_x86_64=('3dfb9c769994b1a1c1ef3661a6cb5ae2364f0a8a3438c44e523adebfd0efb3a6f777186fc2cfa43d521b3166c75fee450f6fcc42397d67af06465d3719780e03')
sha512sums_i686=('54b7affa9834312245560b5a4c7a278df29e5be438ece9301b282c53b0d00b3b3e477d947e06c4fa3427f92d46469bc88c3e33904a9eb9f38a160649e8571d10')
sha512sums_armv7h=('2882638b76a86fb1835b0ecd09791f9b381102cc6216c38ef338d7ce65feae99f40bed09e2562aacfe484907a46868470601a76c8fc70f2ebed8c64480de5918')
sha512sums_aarch64=('5d5e1a3a011958947d53179e73e27930eb10d6646e68bf56ca266ccd18f8cd521657157c40f520f3145087f8e92ade01897dca1c422f7b2f55083030a154491b')

package()
{
    cd "${srcdir}" || exit
    install -Dm644 "${_pkgname}".desktop "${pkgdir}"/usr/share/applications/"${_pkgname}".desktop
    install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/Redot.png
    install -D -m755 Redot_v"${pkgver}"-stable_mono_linux_"${_arch}".zip "${pkgdir}"/usr/bin/redot
    install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
