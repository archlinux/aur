# Maintainer: Juicedata <team@juicefs.io>
# Contributor: Herald Yu <yuhr123@gmail.com>

pkgname=juicefs
_pkgname=juicefs
pkgver=1.0.4
_pkgver=$(echo $pkgver | sed -E 's/^([0-9\.]+)([^0-9].*)?$/\1-\2/' | sed -E 's/-$//')
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3 (Community Edition)."
arch=('x86_64' 'aarch64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
depends=('glibc')
makedepends=('go' 'git')
source=("juicefs-$_pkgver.tar.gz::https://github.com/juicedata/juicefs/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('177917ee5646138e529f9890a311fecfcb89ee9d5fdc2e5aabf8c7ebacb014ba')
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