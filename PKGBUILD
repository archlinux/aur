# Maintainer: Lumpy Zhu<lumpyzhu@aliyun.com>

pkgname=llvm-rc-bin
_pkgname=llvm
pkgver=11.0.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=6
pkgdesc="Collection of modular and reusable compiler and toolchain -PreRelease"

arch=('x86_64')
url="https://prereleases.llvm.org$pkgver"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs' 'zlib' 'ncurses5-compat-libs')
install=$pkgname.install
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver-rc$pkgrel/clang+llvm-$pkgver-rc$pkgrel-x86_64-linux-gnu-ubuntu-20.04.tar.xz"
        "http://archive.ubuntu.com/ubuntu/pool/main/n/ncurses/libtinfo6_6.2-0ubuntu2_amd64.deb"
        "llvm.sh")
sha256sums=('d650e109f78474a7a73a47c060a8e2932a80cbeadbdf26e62e61cc090793a696'
            '87f281a8d5e56dbb259c7ef9f9dead8c52c73982c7bd65b267a71dfc700875fb'
            '4514139cb511ced2c5495988cc248d95552045888c1cb26bbedc7654fa2e7b91')

package() {
    # extract files
    tar xf data.tar.xz
    chmod 755 lib/x86_64-linux-gnu/lib*
    
    # Create directories
    msg2 "Creating directory structure..."
    mkdir -p "$pkgdir"/opt

    msg2 "Moving stuff in place..."
    
    # Install
    mv clang+llvm-11.0.0-rc6-x86_64-linux-gnu-ubuntu-20.04 "$pkgdir"/opt/$_pkgname/
    mv lib/x86_64-linux-gnu/lib* "$pkgdir"/opt/$_pkgname/lib/
    
    # Launchers
    install -m755 $_pkgname.sh "$pkgdir"/opt/$_pkgname
}
