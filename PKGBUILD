# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: xyzzy <628208@gmail.com>

pkgname=spotify-adblock-linux
pkgver=1.2
pkgrel=1
pkgdesc='Spotify adblocker for Linux'
arch=('x86_64')
url=https://github.com/abba23/spotify-adblock-linux
license=('GPL3')
depends=('spotify')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'cef-gf96cd1d.tar.bz2::http://opensource.spotify.com/cefbuilds/cef_binary_80.0.8%2Bgf96cd1d%2Bchromium-80.0.3987.132_linux64_minimal.tar.bz2'
        'spotify-adblock.desktop')
noextract=('cef-gf96cd1d.tar.bz2')
sha512sums=('41325c48ad349c06adc35f978a757af90dc9f9f5611a8c8348d9e41395d83174898e11c7cdcb1b5d0859ac8e6cedb75733e8b8805928eee9a812ad96a2f5b485'
            'ac083fb1b4f5f4b1cef7f31738163d1eab133ae9d2ffff1f502266c406583aca7c5b699af7f1f90ce734cc314fe26164167398089f1cef56c125d0acdea8afdb'
            '69f497a0b869e855b7c6c733c73ee3f285000d56543bf5083382fe1957a9be9a27f8e7eff6e3ef5ccaf5c12ee7750c7e8561bef54e688e5b8b738b320f5cf90a')

prepare() {
  cd $pkgname-$pkgver
  bsdtar -xf ../cef-gf96cd1d.tar.bz2 --strip-components=1 '*/include'
}
build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/applications ../spotify-adblock.desktop
}
