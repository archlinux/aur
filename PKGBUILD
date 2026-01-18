# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
_pkgver=26.1-rc.1
pkgver=26.1_rc.1
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

sha256sums_x86_64=('4e1b7b19ea760e6469d0ec3301666b7512b752b8c2f31e02b58d4fa780f1dceb')
sha256sums_aarch64=('50a90a4c3b51a758fc64c8be12bf6216ef885a1253a5791ab7b462d5b49cbe77')

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
