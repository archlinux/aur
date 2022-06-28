# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast and secure file transfer"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo' 'itstool')
checkdepends=('appstream-glib')
conflicts=("$pkgname-share-files")
replaces=("$pkgname-share-files")
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('e83ea387bb6ea43ef2fa04d7669159977f064b4295623045351063307b928513096bd8fcfa3d7425f3267e458be87a712dae51c5108c2cfe20e468dcca765ea1')
 
build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}
 
check() {
  meson test -C build || :
}
 
package() {
  meson install -C build --destdir "$pkgdir"
}
