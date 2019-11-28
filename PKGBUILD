# Maintainer: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>
pkgname=projfs
pkgver=0.1.3
pkgrel=2
pkgdesc='A FUSE filesystem which does projection of directory content through a custom command. Capable of doing audio/video transparent transcoding (e.g. any music file to mp3).'
url='https://github.com/renyuneyun/projfs'
license=('Apache')
depends=('fuse2')
makedepends=('rust' 'cargo')
arch=('x86_64')
source=("git+https://github.com/renyuneyun/projfs.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/$pkgname/example_projection.yml" "$pkgdir/usr/share/projfs/$pkgname/"
}
