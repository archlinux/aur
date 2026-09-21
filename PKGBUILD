# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Santiago Burgos <santiago.burgos1089@gmail.com>
pkgname=fingwit
pkgver=1.0.9
pkgrel=2
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
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'license.patch')
sha256sums=('30f0914e8e7689f9005fd9a7bf3bc5d188ce42e664a6b39e2fe17abb7a2af4a0'
            'c93378f42af280a724960c895b2007dabaa028368d1aba70d0cde6044f475222')

prepare() {
  cd "$pkgname-$pkgver"

  # Set license type in About dialog
  # https://github.com/linuxmint/hypnotix/pull/406
  patch -Np1 -i ../license.patch
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
