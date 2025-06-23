# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-xml
pkgver=0.25.2.0
pkgrel=1
pkgdesc='XML support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-xml'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('821576d95487e854020fc56f823042caa2a4947545397cafd94497059513a86792a1bc23c43b912000e962291806b98d7dd8ce685fa0483462f0dfcda409fbe8')

check() {
  cd "$pkgname-$pkgver"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
