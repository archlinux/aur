# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: xyzzy

pkgname=spotify-adblock
pkgver=1.0.1
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
b2sums=('e097b0eebe95d91a5412c0a26cc19e955d482f8416feddf41fc0fd9aca8e1fd5f912b1a99a436fa1ab769bb743610b08cdfb71975090dff128a20d356d01105c'
        '35ab8a2d0efbf43c95cda53c5b316f37a38e0bd31f61e1913f0ef541c2fcc031dcf090f7214784178d91515df5981bfc19a590486df7e2a51b19629a4605456c')

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
