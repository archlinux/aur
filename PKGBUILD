# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_reponame=gst-plugins-rs
pkgname=gst-plugin-gtk4
pkgver=0.11.0
pkgrel=1
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(any)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(rust cargo-c)
source=("${url}/-/archive/$pkgver/gst-plugins-rs-$pkgver.tar.bz2")
sha256sums=(9a62ff65d57401d7a70651cb0bcf772b8cfed28c4aa487a649b76ec4b823369a)

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

package() {
  cd $_reponame-$pkgver
  cargo cinstall "${_cargo_opts[@]}" --destdir="$pkgdir"
}
