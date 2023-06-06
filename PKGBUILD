# Maintainer: tarball <bootctl@gmail.com>

pkgname=microdnf
pkgver=3.10.0
pkgrel=1
pkgdesc='Lightweight implementation of dnf in C'
url='https://github.com/rpm-software-management/microdnf'
arch=(i686 x86_64 aarch64)
license=(GPL)

provides=($pkgname)
conflicts=($pkgname)
depends=(glibc glib2 libdnf util-linux-libs libpeas rpm-tools)
makedepends=(meson help2man)
options=('!emptydirs')

source=("$pkgname-$pkgver.tar.gz::https://github.com/rpm-software-management/microdnf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c029017a85c0f8a496e552a1ef2748022c5359b3b4beb32d6b1488710f6aa920')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d "$pkgdir"/etc/yum.repos.d
}
