# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=rpm-builder
pkgver=0.8.1
pkgrel=1
pkgdesc='Build rpms without a spec file. Pure Rust. No dependencies to librpm'
arch=('x86_64')
url=https://github.com/Richterrettich/rpm-builder
license=('Apache 2.0')
makedepends=('rustup')
source=("https://codeload.github.com/Richterrettich/rpm-builder/tar.gz/v${pkgver}")
sha512sums=('79161520466d8e5daec373a46fc5b76a3672add1981fbca3646e147ee234a60df52a8c81dab1840d6049882c983b9b4e2cb11388d17f5248f1d39261add82048')

build() {
  make --directory "${srcdir}/${pkgname}-${pkgver}" build
}

package() {
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.bash" "${pkgdir}/etc/bash_completion.d/${pkgname}.sh"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
