# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=rpm-builder
pkgver=0.6.0
pkgrel=1
pkgdesc='Build rpms without a spec file. Pure Rust. No dependencies to librpm'
arch=('x86_64')
url=https://github.com/Richterrettich/rpm-builder
license=('Apache 2.0')
makedepends=('rustup')
source=("https://codeload.github.com/Richterrettich/rpm-builder/tar.gz/${pkgver}")
sha512sums=('1616b879018d06049dfeda939ca38fec46ea40319dc9a0ca147162fee38362e9c01794f0ba8f3670b473b4ae4ec6ed46f16bd637811a79dfc5d624e7a802f8b3')

build() {
  make --directory "${srcdir}/${pkgname}-${pkgver}" build
}

package() {
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D --mode=0755 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.bash" "${pkgdir}/etc/bash_completion.d/${pkgname}.sh"
  install -D --mode=0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
