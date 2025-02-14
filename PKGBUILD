# Maintainer: Juicedata <team@juicefs.io>
# Contributor: Herald Yu <yuhr123@gmail.com>

pkgname=juicefs
_pkgname=juicefs
pkgver=1.2.3
_pkgver=$(echo $pkgver | sed -E 's/^([0-9\.]+)([^0-9].*)?$/\1-\2/' | sed -E 's/-$//')
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3 (Community Edition)."
arch=('x86_64' 'aarch64' 'arm64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
depends=('glibc' 'fuse2')
makedepends=('go' 'git')
source=("juicefs-$_pkgver.tar.gz::https://github.com/juicedata/juicefs/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('a29145a17deed9b753ad2a48e779bee1d5b17e39980317039bacb089d1c1c85c')
prepare() {
    cd "$_pkgname-$_pkgver"
}
build() {
    cd "$_pkgname-$_pkgver"
    make
}

package() {
    cd "$_pkgname-$_pkgver"
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
    ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
