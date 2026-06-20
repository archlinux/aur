# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
pkgname=llvm-bolt-bin
pkgver=22.1.8
pkgrel=1
pkgdesc='Post-link optimizer developed to speed up large applications'
url="https://github.com/llvm/llvm-project/tree/llvmorg-${pkgver}/bolt"
license=('Apache-2.0 WITH LLVM-exception')
arch=('x86_64')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
makedepends=('libarchive' 'xz')
checkdepends=()
optdepends=()
backup=()
options=(!debug !strip)
install=
source=("https://github.com/llvm/llvm-project/raw/refs/tags/llvmorg-${pkgver}/LICENSE.TXT"
        "https://github.com/llvm/llvm-project/releases/download/llvmorg-${pkgver}/LLVM-${pkgver}-Linux-X64.tar.xz")
noextract=("LLVM-${pkgver}-Linux-X64.tar.xz")
sha256sums=('8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee'
            'df0e1ecf16caf3489a272a5eea4eec9b0d82878f6477fa309504f918a0006384')
validpgpkeys=()

prepare() {
    cd "${srcdir}"
    bsdtar -x -f "LLVM-${pkgver}-Linux-X64.tar.xz" "LLVM-${pkgver}-Linux-X64/bin"/{llvm-bolt*,perf2bolt,merge-fdata}
}

build() {
    true
}

check() {
    true
}

package () {
    mkdir -p "${pkgdir}/usr"/{bin,share/licenses/${pkgname}}

    install -D --preserve-timestamps --mode=644 \
        "--target-directory=${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.TXT"

    cp --archive --no-dereference "--target-directory=${pkgdir}/usr/bin" \
        "${srcdir}/LLVM-${pkgver}-Linux-X64/bin"/{llvm-bolt*,perf2bolt,merge-fdata}
    chmod --no-dereference 755 "${pkgdir}/usr/bin"/*
}
