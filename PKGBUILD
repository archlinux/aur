# Maintainer: Kyle Brennan <kyle@metalspork.xyz>
pkgname=resticprofile
pkgver=0.11.0
pkgrel=1
pkgdesc='Configuration profiles for restic backup'
arch=('x86_64')
url='https://github.com/creativeprojects/resticprofile'
license=('GPL3.0')
depends=('glibc' 'restic')
makedepends=('git' 'make' 'go')
provides=('resticprofile')
source=("https://github.com/creativeprojects/resticprofile/archive/v$pkgver.tar.gz")
sha256sums=('219d2c5155d23a3a6816fb6028639e70861fb03dccef0e5b54cf8b081b61b30b')

importpath='github.com/restic/resticprofile'

prepare() {
    mv $pkgname-$pkgver $pkgname
}

build() {
    cd "$pkgname"
    make build-linux
}

package() {
    install -Dm755 "$pkgname/resticprofile_linux" "$pkgdir/usr/bin/resticprofile"
    install -Dm644 "$pkgname/LICENSE"             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname/README.md"           "$pkgdir/usr/share/doc/$pkgname/README"
    install -dm644 "$pkgdir/usr/share/resticprofile/examples/"
    pwd
    ls
    install -Dm644 $pkgname/examples/*          "$pkgdir/usr/share/resticprofile/examples/"
}
