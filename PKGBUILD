# Maintainer: Atheria <diaviekone13@gmail.com>
pkgname=avc
pkgver=r1.0.3.1
pkgrel=1
pkgdesc="Archive Version Control - High-performance VCS with Git compatibility"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/assembler-0/AVC"
license=('GPL3')
depends=('openssl' 'zlib' 'libdeflate' 'libblake3')
makedepends=('git' 'gcc' 'make' 'cmake' )
provides=('avc')
conflicts=('avc')
source=("https://github.com/assembler-0/AVC.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/*
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/*
    
    # Build with optimizations
    make clean || true
    make release
}

check() {
    cd "$srcdir"/*
    
    # Basic functionality test
    make test || true
}

package() {
    cd "$srcdir"/*
    
    # Install binary
    install -Dm755 "bin/avc" "$pkgdir/usr/bin/avc"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/USAGE.md "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
    install -Dm644 docs/WORKFLOW_SAMPLE.md "$pkgdir/usr/share/doc/$pkgname/WORKFLOW_SAMPLE.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install man page (if you create one)
    # install -Dm644 avc.1 "$pkgdir/usr/share/man/man1/avc.1"
}