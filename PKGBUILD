# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.0_beta.8
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('f53bf3b8954d2275fe6ad19ed71ce6a5e1672675c7a44bf55e9eed2ff72b37f52d281e00c17d233b1453eb09ecf03ca667920a992da0226336741949fe595b27')

build() {
  arch-meson "$pkgname-${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
