# Maintainer: Andy Alt <arch_stanton5995 at proton dot me>

pkgname=pcg-c
pkgver=0.94.1
pkgrel=1
pkgdesc="PCG random number generation library for C"
arch=('x86_64')
url="https://github.com/andy5995/pcg-c"
license=('Apache-2.0 OR MIT')
makedepends=(
  'meson'
  'ninja'
)

source=("https://github.com/andy5995/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89a7dee8b511725e2f954d7f750a4515d310386f448d448dbb4737643b8526bb')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}"/LICENSE*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}"/LICENSE*.txt
}
