# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_reponame=gst-plugins-rs
pkgname=gst-plugin-gtk4
pkgver=0.10.9
pkgrel=2
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(rust cargo-c)
source=("${url}/-/archive/$pkgver/gst-plugins-rs-$pkgver.tar.bz2")
sha256sums=(919c65b35b0787a726dd572be65ced0184855cb5b4314e4c347082633b37ceab)

prepare() {
  cd $_reponame-$pkgver
  cargo fetch
}

_cargo_opts=(-p gst-plugin-gtk4
             --all-features
             --offline
             --release
             --prefix=/usr
             --library-type=cdylib)

build(){
  cd $_reponame-$pkgver
  cargo cbuild "${_cargo_opts[@]}"
}

check() {
  cd $_reponame-$pkgver
  cargo ctest "${_cargo_opts[@]}" --target-dir=tests-build
}

package() {
  cd $_reponame-$pkgver
  cargo cinstall "${_cargo_opts[@]}" --destdir="$pkgdir"
}
