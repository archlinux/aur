# Maintainer: Juicedata <team@juicefs.io>
# Contributor: Herald Yu <yuhr123@gmail.com>

pkgname=juicefs
_pkgname=juicefs
pkgver=1.4.0
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
sha256sums=('3122b9f608bfdc6a477d73ec38b13c30ce6b07a09e046c61a37042153f35e0d3')
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
