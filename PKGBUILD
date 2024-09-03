# Maintainer: Herald Yu <yuhr123@gmail.com>
_pkgname=juicefs
pkgname=${_pkgname}-git
pkgver=1.3.0dev
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3 (Community Edition)."
arch=('x86_64' 'aarch64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
depends=('glibc')
makedepends=('go' 'git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
    cd "$_pkgname"
    printf "1.3.0dev" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$_pkgname"
    make
}
package() {
    cd "$_pkgname"
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
    ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
