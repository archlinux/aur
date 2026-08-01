# Maintainer:
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

: ${_url=https://github.com/guardaco/guarda-desktop-releases}

_pkgname="guarda"
pkgname=guarda
pkgver=1.1.1
pkgrel=1
pkgdesc="A multi-crypto wallet"
url="https://guarda.com"
arch=('x86_64')
license=('LicenseRef-Unknown')

depends=(
  alsa-lib
  at-spi2-core
  cairo
  dbus
  expat
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libcups
  libgcc
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  pango
  systemd-libs
)

provides=("guarda")
conflicts=("guarda")

options=('!debug' '!strip')

_pkgsrc="guarda-$pkgver"
_pkgext="deb"
noextract=("$_pkgsrc.$_pkgext")

source=("$_pkgsrc.$_pkgext"::"$_url/releases/download/v$pkgver/Guarda-$pkgver.$_pkgext" 'merger')
sha256sums=('8827dcfc97d41b1faff85f4cc68399dc3688fa28e8de937060ea2725f4bf5a04')

package() {
  bsdtar -xf "$_pkgsrc.$_pkgext" data.tar.*
  bsdtar -xf data.tar.* -C "$pkgdir"

  rm -rf "$pkgdir/usr/share/doc"

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/opt/Guarda/guarda" "$pkgdir/usr/bin/guarda"
}

