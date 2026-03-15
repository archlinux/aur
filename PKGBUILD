# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=opencl-vanity-gpg
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Rusty GPU/OpenCL-powered vanity PGP keys generator"
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "riscv64"
)
depends=('ocl-icd')
optdepends=('opencl-driver: OpenCL implementation')
makedepends=('cargo')
url="https://github.com/TransparentLC/opencl_vanity_gpg"
license=('AGPL-3.0')

source=("https://github.com/TransparentLC/opencl_vanity_gpg/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=("1156a1e11862bcd2f07db4b2815a53e8c53fa5b1560b48c6d57e8c25fdd3b7f3")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/opencl_vanity_gpg-${pkgver}"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/opencl_vanity_gpg-${pkgver}"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/opencl_vanity_gpg-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 "${srcdir}/opencl_vanity_gpg-${pkgver}/target/release/opencl_vanity_gpg" "${pkgdir}/usr/bin/opencl_vanity_gpg"
    install -Dm0644 "${srcdir}/opencl_vanity_gpg-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm0644 "${srcdir}/opencl_vanity_gpg-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
