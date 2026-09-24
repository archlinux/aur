# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="redot-mono"
pkgname="$_pkgname-bin"
_pkgver=26.3-rc.1
pkgver=26.3_rc.1
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

sha256sums_x86_64=('532414db861b5ef635e016251f5831c5c71ebe4ab78853daac7713a9fc192ac2')
sha256sums_aarch64=('721ee4b23fb028499b1fc29e2a41a10b57e667ace81e73127e2cecc9670fb41a')

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
