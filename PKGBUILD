# Maintainer: Niyoko Yuliawan (niyoko on the AUR)

pkgname=ytm-rs-bin
pkgver=2.0.2
pkgrel=1
pkgdesc='Native YouTube Music client'
arch=('x86_64')
url='https://github.com/grapedjuice/ytm-rs'
license=('GPL-3.0-only')
# AppIndicator is loaded at runtime. desktop-file-utils registers the Jam URL handler.
depends=('alsa-lib' 'cairo' 'dbus' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2'
         'glibc' 'gtk3' 'libayatana-appindicator' 'libgcc' 'libsoup3' 'libstdc++'
         'libcrypto.so=4-64' 'libssl.so=4-64' 'webkit2gtk-4.1')
optdepends=('libpulse: song recognition via parec')
provides=("ytm-rs=$pkgver")
conflicts=('ytm-rs')
options=('!strip' '!debug')

_archive="ytm-rs-$pkgver-1-${arch[0]}.pkg.tar.zst"
source=("$url/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('f058fba857003a0f66088a16f06fdb81d9c9b08d815d14afd2056f5792aac66e')

package() {
  # Copy the payload without the upstream pacman metadata.
  bsdtar --no-same-owner -xf "$_archive" -C "$pkgdir" usr
  mv "$pkgdir/usr/share/licenses/ytm-rs" "$pkgdir/usr/share/licenses/$pkgname"
}
