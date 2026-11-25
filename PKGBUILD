# Maintainer: Niyoko Yuliawan (niyoko on the AUR)

pkgname=ytm-rs-bin
pkgver=0.4.0
pkgrel=1
# Upstream returned to its 0.x version series after v2.0.2.
epoch=1
pkgdesc='Native YouTube Music client'
arch=('x86_64')
url='https://github.com/grapedjuice/ytm-rs'
license=('GPL-3.0-only')
# AppIndicator is loaded at runtime. desktop-file-utils registers the Jam URL handler.
depends=('alsa-lib' 'cairo' 'dbus' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2'
         'glibc' 'gtk3' 'libayatana-appindicator' 'libgcc' 'libsoup3' 'libstdc++'
         'libcrypto.so=4-64' 'libssl.so=4-64' 'webkit2gtk-4.1')
optdepends=('libpulse: song recognition via parec')
provides=("ytm-rs=$epoch:$pkgver")
conflicts=('ytm-rs')
options=('!strip' '!debug')

_archive="ytm-rs-$pkgver-1-${arch[0]}.pkg.tar.zst"
source=("$url/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('a11c5f979c1ed038b7e8311787587c3a65d764557b0fc046d9b7634714ccca11')

package() {
  # Copy the payload without the upstream pacman metadata.
  bsdtar --no-same-owner -xf "$_archive" -C "$pkgdir" usr
  mv "$pkgdir/usr/share/licenses/ytm-rs" "$pkgdir/usr/share/licenses/$pkgname"
}
