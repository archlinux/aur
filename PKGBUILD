# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
_pkgname=AngryOxide
pkgver=0.8.1
pkgrel=1
_patch=""
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('Unspecified')
makedepends=('cargo' 'git')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('b418e351e8b06921748657b3a64e854e6880bbb0def46f089339204edab5c5f541669ca0ad46378fbe24442416ec4b8e3b29527532dfaa1a7810e1f8a1f5e0d2')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}${_patch}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
