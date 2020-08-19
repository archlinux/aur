# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=rpm-builder
pkgver=0.7.0
pkgrel=1
pkgdesc='Build rpms without a spec file. Pure Rust. No dependencies to librpm'
arch=('x86_64')
url=https://github.com/Richterrettich/rpm-builder
license=('Apache 2.0')
makedepends=('rustup')
source=("https://codeload.github.com/Richterrettich/rpm-builder/tar.gz/${pkgver}")
sha512sums=('f3ec9ae302adde706f20bf12c4ef4ee55999b1387d2a60e24e89683fc9f28dc57da4ff9fcdb3c28e885a5e9990f39d578db9a40e7118b46d38aa083eca89b888')

build() {
  make --directory "${srcdir}/${pkgname}-${pkgver}" build
}

package() {
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.bash" "${pkgdir}/etc/bash_completion.d/${pkgname}.sh"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
