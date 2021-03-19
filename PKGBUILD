# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: xyzzy

pkgname=spotify-adblock-linux
pkgver=1.3
pkgrel=1
pkgdesc='Spotify adblocker for Linux'
arch=('x86_64')
url=https://github.com/abba23/spotify-adblock-linux
license=('GPL3')
depends=('spotify')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'cef-g4fe33a1.tar.bz2::https://cef-builds.spotifycdn.com/cef_binary_88.1.6%2Bg4fe33a1%2Bchromium-88.0.4324.96_linux64_minimal.tar.bz2'
        'spotify-adblock.desktop')
noextract=('cef-g4fe33a1.tar.bz2')
sha512sums=('7a2a2b885b147073103348cdac41fe1256e749899414f7c6570ec02aad691acedb39fb826166fdc170326fe17ae45660ef0421f50fd3e945631a89d90f4bcc06'
            'd67ac68a2e8ba32ae6c6d26fc872d62ae81e25c46b9dfc50eaf2790ea661d527404d0a2b187c7fa7fe2a9f9c8ee99dded77fbef0a1718158c06cd0724108d794'
            '69f497a0b869e855b7c6c733c73ee3f285000d56543bf5083382fe1957a9be9a27f8e7eff6e3ef5ccaf5c12ee7750c7e8561bef54e688e5b8b738b320f5cf90a')

prepare() {
  cd $pkgname-$pkgver
  bsdtar -xf ../cef-g4fe33a1.tar.bz2 --strip-components=1 '*/include'
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
