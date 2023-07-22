# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: xyzzy

pkgname=spotify-adblock
pkgver=1.0.2
pkgrel=2
epoch=1
pkgdesc='Adblocker for Spotify'
arch=('x86_64')
url=https://github.com/abba23/spotify-adblock
license=('GPL3')
depends=('spotify')
makedepends=('rust')
provides=("$pkgname-linux")
replaces=("$pkgname-linux")
backup=('etc/spotify-adblock/config.toml')
options=('!strip')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
b2sums=('5247d1746a30805d218fc183d75adb249f6517b0dace9460b7be18fe63b6209bb49c0084973f1d28452901dedb839eba7e3e427d758dc78139e9aa4ed8a46009'
        '39f7b71aa8b6b894513812742b5ecbd4ab9ee60482f455555529be356b93724a663d9b4db21675b51db615594ed73fa7657eeab6d2b1679cd6a5572b2566a68a')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
