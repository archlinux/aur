# Maintainer: Your Name <your.email@domain.com>
pkgname=memprocfs
providers=(memprocfs)
pkgver=5.14
pkgrel=11
pkgdate='20250501'

pkgdesc="MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system."
arch=('x86_64' 'aarch64')
url="https://github.com/ufrisk/MemProcFS"
license=('GPL3')
depends=('fuse' 'lz4' 'openssl' 'libusb')
optdepends=('python: for python bindings')

source_x86_64=("https://github.com/ufrisk/MemProcFS/releases/download/v${pkgver}/MemProcFS_files_and_binaries_v${pkgver}.${pkgrel}-linux_x64-${pkgdate}.tar.gz")
source_aarch64=("https://github.com/ufrisk/MemProcFS/releases/download/v${pkgver}/MemProcFS_files_and_binaries_v${pkgver}.${pkgrel}-linux_aarch64-${pkgdate}.tar.gz")
sha256sums_x86_64=('c5f008eb788b70f773e0e5ef35dae24b9eeb0b9665b66e3a772325d4ec249f79')
sha256sums_aarch64=('4a3da260194514dec97855bd916ce77203530056fd2f97c26deea70a3d6f8a08')
sha512sums_x86_64=('d58ce642c2ea8ebc10f773c5e14a54a77f14cef343a4fd974943d93221d8ba16ca7d8ca0a296530e0e8cbfe26e65e72afc22b9a002c105eff8571569d69f1ef0')
sha512sums_aarch64=('ce184ee7b7f984d813e5c381164c5e5b0e8961eb331e8f050fa973755e5a73e5776929536d6474417647f7a8e1fb571f6fab0d54c67aa89fe4b8a9b529afedc3')

package() {
    cd "$srcdir"

    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/memprocfs"
    install -dm755 "$pkgdir/usr/include"

    # Install binaries
    install -Dm755 memprocfs "$pkgdir/usr/bin/memprocfs"

    # Install headers
    install -Dm644 *.h "$pkgdir/usr/include"

    # Install libraries
    install -Dm755 *.so "$pkgdir/usr/lib/"

    # Install Python files if any
    if [ -d "python" ]; then
        cp -r python "$pkgdir/usr/share/memprocfs/"
    fi

    # Install documentation if any
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
