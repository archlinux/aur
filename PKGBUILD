# Maintainer: DawnMagnet <DawnMagnet@users.noreply.github.com>
pkgname=memprocfs
pkgver=5.19.3
pkgrel=20261111
pkgdesc="MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system."
arch=('x86_64' 'aarch64')
url="https://github.com/ufrisk/MemProcFS"
license=('GPL3')
depends=('fuse' 'lz4' 'openssl' 'libusb')
optdepends=('python: for python bindings')
provides=('memprocfs')
options=('!strip')

# Version scheme (vercmp-ordered, and newer than the old AUR version
# 5.16-9.20260104):
#   Upstream asset names look like
#     MemProcFS_files_and_binaries_v5.19.0-linux_x64-20261014.tar.gz
#   pkgver is the embedded upstream version (major.minor.build).
#   pkgrel is the asset date YYYYMMDD (a plain integer).
# vercmp compares pkgver before pkgrel, so 5.19.0-20261014 > 5.16-9.20260104
# and 5.16.14-20260211 > 5.16-9.20260104. A newer build number bumps pkgver.
# A rebuilt asset of the same build number bumps pkgrel via the date.
# The release tag (v5.16, v5.19, ...) stays in the download URL path.
source_x86_64=("https://github.com/ufrisk/MemProcFS/releases/download/v5.19/MemProcFS_files_and_binaries_v5.19.3-linux_x64-20261111.tar.gz")
source_aarch64=("https://github.com/ufrisk/MemProcFS/releases/download/v5.19/MemProcFS_files_and_binaries_v5.19.3-linux_aarch64-20261111.tar.gz")
sha256sums_x86_64=('501122b767dae18153d20dc5eca16f895bfe3b09247f3991aa99c00ae5a786b3')
sha256sums_aarch64=('dbf5ede6e878de97a60ba1eecb49cf68e615a6be03d72db4552ae6d4142d7e8e')

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/memprocfs"
    install -dm755 "$pkgdir/usr/include"

    install -Dm755 memprocfs "$pkgdir/usr/bin/memprocfs"
    install -Dm644 *.h "$pkgdir/usr/include/"
    install -Dm755 *.so "$pkgdir/usr/lib/"

    if [[ -d python ]]; then
        cp -r python "$pkgdir/usr/share/memprocfs/"
    fi

    if [[ -f README.md ]]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    elif [[ -f LICENSE.txt ]]; then
        install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
