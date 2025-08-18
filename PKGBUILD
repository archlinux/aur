# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=archivemount-ng-git
_name=${pkgname%-git}
pkgver=1b.r1.gbf14b8b
pkgrel=1
pkgdesc='FUSE based filesystem for mounting compressed archives (new upstream)'
arch=('x86_64')
url="https://git.sr.ht/~nabijaczleweli/$_name"
license=('0BSD AND LGPL-2.0-or-later')
depends=('fuse3' 'gcc-libs' 'glibc' 'libarchive')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')
provides=("archivemount" "$_name")
conflicts=("archivemount" "$_name")

pkgver() {
    cd $_name
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd $_name
    make
}

check() {
    cd $_name
    make -k check
}

package() {
    cd $_name
    install -Dm644 LICENSES/0BSD.txt "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"
    make DESTDIR="$pkgdir/" PREFIX=usr install
}
