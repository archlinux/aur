# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
_pkgver=26.1-beta.0
pkgver=26.1_beta.0
_pkgfmt=_linux_mono_
pkgrel=1
pkgdesc="A multi-platform 2D and 3D game engine"
url="https://www.redotengine.org/"
license=('MIT')
provides=("$_pkgname")
conflicts=('redot' 'redot-bin' "$_pkgname")

arch=('x86_64' 'aarch64')
_arch='x64'

if test "$CARCH" == 'aarch64'; then
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

source=("${_pkgname}.desktop" 'icon.png' 'LICENSE.txt')
sha256sums=('SKIP' 'SKIP' 'SKIP')

source_x86_64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${_pkgver}/Redot_v${_pkgver}${_pkgfmt}${_arch}.zip")
source_aarch64=("https://github.com/Redot-Engine/redot-engine/releases/download/redot-${_pkgver}/Redot_v${_pkgver}${_pkgfmt}${_arch}.zip")

sha256sums_x86_64=('3397590dc422a527f434cccd4a69e54738e0aa66ee0f830338cdfc02f090c37a')
sha256sums_aarch64=('af7e5486084f6bac66dd09eb32a54a9001390824fbf7aa46ffd80facad8d2e98')

package() {
  mkdir -p ${pkgdir}/opt/${_pkgname}
  mkdir -p ${pkgdir}/usr/bin/

  cd ${srcdir} || exit

  cp -r $(pwd)/* ${pkgdir}/opt/${_pkgname}/

  # move into directory
  cd ${pkgdir}/opt/${_pkgname}

  # rename executable
  mv redot.linuxbsd.editor.${arch}.mono ${_pkgname}

  # back to top
  cd ${srcdir}

  ln -srf ${pkgdir}/opt/${_pkgname}/redot-mono ${pkgdir}/usr/bin/${_pkgname}

  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/Redot.png
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
