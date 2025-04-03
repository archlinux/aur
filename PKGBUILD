# Maintainer: Your Name <your.email@domain.com>
pkgname=memprocfs
providers=(memprocfs)
pkgver=5.14
pkgrel=8
pkgdate='20250323'

pkgdesc="MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system."
arch=('x86_64' 'aarch64')
url="https://github.com/ufrisk/MemProcFS"
license=('GPL3')
depends=('fuse' 'lz4' 'openssl' 'libusb')
optdepends=('python: for python bindings')

source_x86_64=("https://github.com/ufrisk/MemProcFS/releases/download/v${pkgver}/MemProcFS_files_and_binaries_v${pkgver}.${pkgrel}-linux_x64-${pkgdate}.tar.gz")
source_aarch64=("https://github.com/ufrisk/MemProcFS/releases/download/v${pkgver}/MemProcFS_files_and_binaries_v${pkgver}.${pkgrel}-linux_aarch64-${pkgdate}.tar.gz")
sha256sums_x86_64=('a6c2560613bb2d83a475ad03d6e041e790e881fda0e33ac301995b2dc8518bd0')
sha512sums_aarch64=('e975da8671ad7fadc63228be13e84c21fae1df2bb05836b1f24603b5c22a4870 ')

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
