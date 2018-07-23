# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=cryptocat-bin
pkgver=3.2.08
pkgrel=1
pkgdesc='Secure chat client based on Electron (bin)'
arch=(x86_64)
url=https://crypto.cat
license=(GPL3)
depends=(glib2 fuse2 gconf)
makedepends=(gendesk gnupg)
provides=(cryptocat)
conflicts=(cryptocat)
options=(!strip)
source=(https://download.crypto.cat/client/Cryptocat-linux-x64.zip)
sha512sums=(6bdb8d23bb1ab4b2706437806da770486001315b79956ee5939960af3eb3074b82049aab2ae0a7235ebd3a374bb46464488587be9a0e6d34a1d5c50eee9ac146)

prepare() {
  msg2 'Run `gpg --recv-keys AB266CB76091B1F8` for GPG verification to work'
  gpg --verify Cryptocat.AppImage.asc Cryptocat.AppImage
  gendesk -f -n --pkgname cryptocat --pkgdesc "$pkgdesc"
  bsdtar --to-stdout -xf Cryptocat.AppImage \
    usr/share/icons/default/64x64/apps/cryptocat.png > cryptocat.png
}

package() {
  install -D Cryptocat.AppImage $pkgdir/usr/bin/cryptocat
  install -Dm 644 cryptocat.desktop $pkgdir/usr/share/applications/cryptocat.desktop
  install -Dm 644 cryptocat.png $pkgdir/usr/share/pixmaps/cryptocat.png
}
