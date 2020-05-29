# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=peertube-viewer-rs-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('x86_64')
url="https://gitlab.com/SostheneGuedon/peertube-viewer-rs" 
license=('MIT')
md5sums=('1069c3eee1c4dd5a28981c2afb018ea3')
depends=('openssl')
provides=("peertube-viewer-rs")
conflicts=("peertube-viewer-rs")
source=("release.tar.gz.zip::https://gitlab.com/SostheneGuedon/peertube-viewer-rs/-/jobs/artifacts/v1.3.1/download?job=release-linux")
noextract=("release.tar.gz.zip")

prepare() {
    rm -rf linux-build
    unzip release.tar.gz.zip
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
