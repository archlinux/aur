# Maintainer: xyzzy
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=spotify-adblock
pkgver=1.1.1
pkgrel=1
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
b2sums=('a1eb5ff68e40defd8ef76f1cd26a8a11190764fcce15ff2ce9d09014a82e7ac91f4580388ef4670bec91cd3c6fac80dc4daa21daaaffebdd93fb528782b15def'
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
