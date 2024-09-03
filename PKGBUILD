# Maintainer: Juicedata <team@juicefs.io>
# Contributor: Herald Yu <yuhr123@gmail.com>

pkgname=juicefs
_pkgname=juicefs
pkgver=1.2.1
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
sha256sums=('1cb3908424e210535842cfb9ab612421b2f84261acd9d9fd537b3a5ef1fd6779')
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
