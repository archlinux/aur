# Maintainer: Your Name <your.email@domain.com>
pkgname=memprocfs
providers=(memprocfs)
pkgver=5.15
pkgrel=2
pkgdate='20250711'

pkgdesc="MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system."
arch=('x86_64' 'aarch64')
url="https://github.com/ufrisk/MemProcFS"
license=('GPL3')
depends=('fuse' 'lz4' 'openssl' 'libusb')
optdepends=('python: for python bindings')

source_x86_64=("https://github.com/ufrisk/MemProcFS/releases/download/v${pkgver}/MemProcFS_files_and_binaries_v${pkgver}.${pkgrel}-linux_x64-${pkgdate}.tar.gz")
source_aarch64=("https://github.com/ufrisk/MemProcFS/releases/download/v${pkgver}/MemProcFS_files_and_binaries_v${pkgver}.${pkgrel}-linux_aarch64-${pkgdate}.tar.gz")
sha256sums_x86_64=('10bc558ca84eb49402311b8feebf51329c1b923cda62567a410c9d9c0770439e')
sha256sums_aarch64=('6c397eedf80a8d6bada938fc5d7ccfcd8cbfd0f479495d4b6d501bbca63faa7e')
sha512sums_x86_64=('5880e4ac06bbc8fb9c002f4f5cbdd16b30d7cd86cd3a17dbb78c54bb73841f1da8c19e987544c367385978b8750b028d787dd9d55817d4483041d7f01b79c402')
sha512sums_aarch64=('342b6fe1858e258ec924cbe5eb0867f538a4cd6f1e9f283742c5d82acd4de8f834a7c15c9305022c3d3dc315941eb26606131ffdff2128d5be73cd9707f8fc4a')

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
