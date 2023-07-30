# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_reponame=gst-plugins-rs
pkgname=gst-plugin-gtk4
pkgver=0.10.11
pkgrel=1
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(rust cargo-c)
source=("${url}/-/archive/$pkgver/gst-plugins-rs-$pkgver.tar.bz2")
sha256sums=(150d5d5dbb78d8a0f46aa9f4fb25edbbc54a9599d583bf40d1f3f46fe1f13a51)

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
