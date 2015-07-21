# Maintainer: mar77i <mar77i at mar77i dot ch>
pkgname=bulk77i-apps-git
_pkgname=bulk77i-apps
pkgrel=1
pkgver=v0.1
pkgdesc="Collection of executable targets that were developed around bulk77i modules"
arch=(x686 x86_64)
url="https://github.com/mar77i/bulk77i-apps"
license=('GPL')
makedepends=('git' 'bulk77i-git')
source=("git+https://github.com/mar77i/bulk77i-apps.git")
md5sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --tags |sed 's/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  local lpfx="/usr/share/licenses"
  cd "$srcdir"
  make -C "$_pkgname" DESTDIR="$pkgdir/" PREFIX=/usr install
  install -m644 -D "$_pkgname/LICENSE" "$pkgdir/$lpfx/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
