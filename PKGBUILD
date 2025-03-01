# Maintainer: cubic_control <fullerbenjamind02[at]gmail[dot]com>

_pkgname="hellfire"
pkgname="$_pkgname-browser-bin"
pkgver=137.0a1
# Package download has wrong name as of current release.
_pkgver_name=136.0a1

pkgrel=1
pkgdesc="Optimized Firefox for GNU/Linux & Windows"
url="https://github.com/CYFARE/HellFire"
license=('MPL')
provides=("$_pkgname")
conflicts=("$_pkgname")

arch=('x86_64')

# Copied from Firefox pkgbuild
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
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
makedepends=(
  7zip
)


source=("${_pkgname}.desktop" 'default128.png' 'LICENSE.md')
sha256sums=('SKIP' 'SKIP' 'SKIP')

source_x86_64=("https://github.com/CYFARE/HellFire/releases/download/v${pkgver}/${_pkgname}-${_pkgver_name}.en-US.linux-x86_64.7z")

sha256sums_x86_64=('8d655bb456593a750d421be865b54e4cba8fee6254ba4ce4252ffe1176b00466')

package()
{
    mkdir -p ${pkgdir}/opt/${_pkgname}
    mkdir -p ${pkgdir}/usr/bin/

    cd ${srcdir} || exit

    7za x ${_pkgname}-${_pkgver_name}.en-US.linux-x86_64.7z -o${_pkgname}

    cp -r ${_pkgname}/firefox/* ${pkgdir}/opt/${_pkgname}/

    ln -srf ${pkgdir}/opt/${_pkgname}/firefox ${pkgdir}/usr/bin/${_pkgname}

    install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm644 default128.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
    install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
