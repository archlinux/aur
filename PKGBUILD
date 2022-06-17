# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Gustavo Peredo <gustavomperedo@protonmail.com>

pkgname=fontdownloader
_pkgname=Font-Downloader
pkgver=10.0.0
pkgrel=1
pkgdesc="A simple GTK font downloader"
arch=('x86_64' 'aarch64')
url="https://github.com/GustavoPeredo/font-downloader"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('e53c16e34db612e17eb185ae714147f7ec9c75ba16c0cd8ae55fc73cc719934a0818f99e118861c7447c35ef9f7a0747a18e553cf60c2f7d36c016a17013a2e2')


build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build || :
}
 
package() {
  meson install -C build --destdir "$pkgdir"
}
