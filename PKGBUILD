# Maintainer: Sean Greenslade <aur@seangreenslade.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_pkgbase=acpi
pkgname=${_pkgbase}-unified-patch
pkgver=1.7
pkgrel=2
pkgdesc='Client for battery, power, and thermal readings - patch to merge batteries by default'
arch=('x86_64')
url='https://sourceforge.net/projects/acpiclient/files/acpiclient/'
license=('GPL2')
depends=('glibc')
provides=('acpi')
conflicts=('acpi')
source=("https://downloads.sourceforge.net/acpiclient/${_pkgbase}-$pkgver.tar.gz" "0001_add_merged.patch")
sha256sums=('d7a504b61c716ae5b7e81a0c67a50a51f06c7326f197b66a4b823de076a35005'
            'df6737f2e76d0ee70eba2b4a7998864f266fc260b3ea24d4df7bf7a19c72120a')

prepare() {
  cd "${srcdir}/${_pkgbase}-$pkgver"

  patch -p1 -N <${srcdir}/0001_add_merged.patch
}

build() {
  cd "${srcdir}/${_pkgbase}-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  make -C "${_pkgbase}-$pkgver" DESTDIR"=$pkgdir" install
}

# vim:ts=2 sw=2 et:
