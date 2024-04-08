# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=vkroots
pkgver=r29.d5ef31a
pkgrel=1
pkgdesc="A stupid simple method of making Vulkan layers, at home!"
arch=(any)
url="https://github.com/Joshua-Ashton/vkroots"
license=('LGPL-2.1-or-later AND (Apache-2.0 or MIT)')
makedepends=("git" "meson")
provides=("$pkgname")
conflicts=("$pkgname")
_commit='d5ef31abc7cb5c69aee4bcb67b10dd543c1ff7ac'
source=("git+https://github.com/Joshua-Ashton/vkroots.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  meson rewrite kwargs set project / version $pkgver
  arch-meson "$srcdir/build"
}

build() {
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
