# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=rpm-builder
pkgver=0.8.0
pkgrel=1
pkgdesc='Build rpms without a spec file. Pure Rust. No dependencies to librpm'
arch=('x86_64')
url=https://github.com/Richterrettich/rpm-builder
license=('Apache 2.0')
makedepends=('rustup')
source=("https://codeload.github.com/Richterrettich/rpm-builder/tar.gz/v${pkgver}")
sha512sums=('3aa746721274e48679f0bd4e961ef20f8bb00db16436f3141e434ccd3c97dbbe0f0e2a38ebead3d7875f83e70d8836e4232d0ad90bb9e38ab4f7f41485b1d6f6')

build() {
  make --directory "${srcdir}/${pkgname}-${pkgver}" build
}

package() {
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.bash" "${pkgdir}/etc/bash_completion.d/${pkgname}.sh"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
