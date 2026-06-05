# Maintainer: xyzzy
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=spotify-adblock
pkgver=1.1.0
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
b2sums=('8bd551806ca097e3ac3f172c8b5994d4d54e23bbd92c6c88ba0249722c30c7ba2168a5224ceeba0767ea9f5801528aacf5ca5068ad76413a7dd010b975366de7'
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
