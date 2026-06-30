# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Santiago Burgos <santiago.burgos1089@gmail.com>
pkgname=fingwit
pkgver=1.0.9
pkgrel=1
pkgdesc="Fingerprint Configuration Tool"
url="https://github.com/xapp-project/fingwit"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'audit'
  'fprintd'
  'gtk3'
  'libfprint'
  'pam'
  'polkit'
  'python'
  'python-gobject'
  'python-setproctitle'
  'xapp'
  'xapp-symbolic-icons'
)
makedepends=(
  'meson'
  'ninja'
)
source=("${pkgname}_${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('30f0914e8e7689f9005fd9a7bf3bc5d188ce42e664a6b39e2fe17abb7a2af4a0')

prepare() {
  cd $pkgname-$pkgver

  # Fix license path
  # Dialog expands too wide
#  sed -i 's|common-licenses/GPL|licenses/spdx/GPL-3.0-or-later.txt|g' "$pkgname"
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
