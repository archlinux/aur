# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="hellfire"
pkgname="$_pkgname-browser-bin"

_pkgver=148.0a1
_pkgverx=""
pkgver=${_pkgver}${_pkgverx}

pkgrel=2
pkgdesc="Optimized Firefox for GNU/Linux"
url="https://github.com/CYFARE/HellFire"
license=('MPL')
provides=("$_pkgname")
conflicts=("$_pkgname")

arch=('x86_64')

depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg4.4
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)

source=("${_pkgname}.desktop" 'default128.png' 'LICENSE.md')
sha256sums=('SKIP' 'SKIP' 'SKIP')

source_x86_64=("https://github.com/CYFARE/HellFire/releases/download/v${pkgver}/hellfire-${_pkgver}.en-US.linux-x86_64.7z")
sha256sums_x86_64=('1526a0d9618be569e93cb37cc3532bf3bc9c725445ff87ba6deb763d8466af8d')

package() {
  mkdir -p ${pkgdir}/opt/${_pkgname}
  mkdir -p ${pkgdir}/usr/bin/

  cd ${srcdir} || exit

  cp -r $(pwd)/firefox/* ${pkgdir}/opt/${_pkgname}/

  ln -srf ${pkgdir}/opt/${_pkgname}/firefox ${pkgdir}/usr/bin/${_pkgname}

  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 default128.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
