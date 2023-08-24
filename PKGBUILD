# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
pkgname=gst-plugin-gtk4
pkgver=0.11.0
pkgrel=2
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://crates.io/crates/$pkgname"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(rust cargo-c)
source=("$pkgname-$pkgver.tar.gz"::"https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=(c3ee0132150ee059c35642b51c5d663eadb9fa4d21f83a56dd584b03c1c45ffd)

prepare() {
  cd $pkgname-$pkgver
  cargo fetch
}

_cargo_opts=(--all-features
             --offline
             --release
             --prefix=/usr
             --library-type=cdylib)

build(){
  cd $pkgname-$pkgver
  cargo cbuild "${_cargo_opts[@]}"
}

package() {
  cd $pkgname-$pkgver
  cargo cinstall "${_cargo_opts[@]}" --destdir="$pkgdir"
}
