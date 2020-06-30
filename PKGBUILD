# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer-rs
pkgver=1.6.0
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('any')
url="https://gitlab.com/peertube-viewer/peertube-viewer-rs" 
license=('MIT')
depends=('openssl')
makedepends=(
  'rust'
)

source=("https://gitlab.com/peertube-viewer/peertube-viewer-rs/-/archive/v$pkgver/peertube-viewer-rs-v$pkgver.tar.gz")
md5sums=('71953cdb752ac252ee2c9bda99937d3a')

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
}
