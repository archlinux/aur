# Maintainer: Your Name <your.email@domain.com>
pkgname=memprocfs
providers=(memprocfs)
pkgver=5.12.7
pkgrel=1
pkgdesc="MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system."
arch=('x86_64' 'aarch64')
url="https://github.com/ufrisk/MemProcFS"
license=('GPL3')
depends=('fuse' 'python')
source_x86_64=("https://github.com/ufrisk/MemProcFS/releases/download/v5.12/MemProcFS_files_and_binaries_v${pkgver}-linux_x64-20241115.tar.gz")
source_aarch64=("https://github.com/ufrisk/MemProcFS/releases/download/v5.12/MemProcFS_files_and_binaries_v${pkgver}-linux_aarch64-20241115.tar.gz")
sha512sums_x86_64=('5cacdd3da66c45fee3c3f77f094ec3ebb214aa3457476adfb90a9bbda51d397170951c1832c3b345fcada0b534697d23e2786842707c246457f72a32db09fc6b')
sha512sums_aarch64=('1a22d0c05cc0d42cf3b40140b654eefaf2ee09543f4ba62504053311b6317cff7372860964b0e202e421ed715c702f04d63f2951897368b8a26546d43a5ef4cf')

package() {
    cd "$srcdir"

    # Create directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/memprocfs"

    # Install binaries
    install -Dm755 memprocfs "$pkgdir/usr/bin/memprocfs"

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
