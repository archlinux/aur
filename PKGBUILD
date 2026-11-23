pkgname=catgirldownloader
pkgver=0.6.1
pkgrel=1
pkgdesc="GTK4 application that downloads images from nekos.moe"
arch=('any')
url="https://github.com/NyarchLinux/CatgirlDownloader"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'python-requests'
  'gtk4'
  'libadwaita'
  'glib2'
)
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a0ea7e8f89b7bfe3d800eb611d56260d89451bd127ca81795c1956bd921fc87d')

prepare() {
  cd CatgirlDownloader-${pkgver}
  # upstream forgot to bump the version in meson.build (shown in the About dialog)
  sed -i "s/^\( *version: \)'[^']*'/\1'${pkgver}'/" meson.build
}

build() {
  arch-meson CatgirlDownloader-${pkgver} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
