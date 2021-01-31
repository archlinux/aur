# Maintainer: Sosthène Guédon <dev@peertube-viewer.com>
pkgname=peertube-viewer-rs
pkgver=1.8.0
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('any')
url="https://peertube-viewer.com" 
license=('MIT')
makedepends=(
  'rust'
)

depends=(
  'gcc-libs'
)
source=("https://gitlab.com/peertube-viewer/peertube-viewer-rs/-/archive/v$pkgver/peertube-viewer-rs-v$pkgver.tar.gz")
sha256sums=('c9bce48729f2643041fcb07c1a335657e479fed80ae8ac96d11c74d12a3a21e8')

build() {
    cd $pkgname-v$pkgver
    cargo b --release --locked
}

package() {
    cd $pkgname-v$pkgver
    install -Dm755 target/release/peertube-viewer-rs $pkgdir/usr/bin/peertube-viewer-rs
    install -Dm755 completions/peertube-viewer-rs.bash $pkgdir/etc/bash_completion.d/peertube-viewer-rs.bash

    install -Dm755 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1

    install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
