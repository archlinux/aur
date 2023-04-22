# Maintainer: tarball <bootctl@gmail.com>

pkgname=microdnf
pkgver=3.9.1
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
sha256sums=('912a17f741fc7d1a0f8ffa46bec744dedec46d801d965270b1f77c56eb03c672')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d "$pkgdir"/etc/yum.repos.d
}
