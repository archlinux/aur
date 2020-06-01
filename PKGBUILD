# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer-rs-bin
pkgver=1.4.0
pkgrel=2
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://gitlab.com/SostheneGuedon/peertube-viewer-rs" 
license=('MIT')
depends=('openssl')
provides=("peertube-viewer-rs")
conflicts=("peertube-viewer-rs")

md5sums=('717320bec663f11587b8f2557b3b414e')
source=("release-v$pkgver.tar.gz.zip::https://gitlab.com/SostheneGuedon/peertube-viewer-rs/-/jobs/artifacts/v$pkgver/download?job=release-linux")
noextract=("release-v$pkgver.tar.gz.zip")

prepare() {
    rm -rf linux-build
    unzip release-v$pkgver.tar.gz.zip
    mkdir -p "$pkgname-v$pkgver"
    tar -xf "linux-build/peertube-viewer-rs-v$pkgver.tar.gz" -C "$pkgname-v$pkgver"
}

package() {
    cd $pkgname-v$pkgver
    install -Dm755 peertube-viewer-rs $pkgdir/usr/bin/peertube-viewer-rs
    install -Dm755 completions/peertube-viewer-rs.bash $pkgdir/etc/bash_completion.d/peertube-viewer-rs.bash

    install -Dm755 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
}
