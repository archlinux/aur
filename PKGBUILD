# Maintainer: k1f0 <archlinux at k1f0.mozmail.com>

pkgname=angryoxide
_pkgname=AngryOxide
pkgver=0.8.3
pkgrel=1
_patch=""
pkgdesc='802.11 Attack Tool'
arch=('x86_64')
url='https://github.com/Ragnt/AngryOxide'
license=('Unspecified')
makedepends=('cargo' 'git')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('1ef8e900d965599d5f9de32487ee47f6dc4acb4293e47e4c38ebd0b0a7589265a2c0a376ea6445843e64d54173159ecb0793fd889d6a7a5f25fdade3989f4b57')

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
