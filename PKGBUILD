# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: xyzzy

pkgname=spotify-adblock
pkgver=1.0.2
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
b2sums=('5247d1746a30805d218fc183d75adb249f6517b0dace9460b7be18fe63b6209bb49c0084973f1d28452901dedb839eba7e3e427d758dc78139e9aa4ed8a46009'
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
