# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm-bin
_pkgname=smolvm
pkgver=1.0.1
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=(
    'libkrun'
    'libkrunfw'
    'seatd'
    'crun'
)
makedepnds=('patch')
options=(!debug)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm')
source=(
    "$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/smol-machines/$_pkgname/refs/tags/v$pkgver/LICENSE"
    'use-system-libs.patch'
)
sha256sums=(
    'a4c85e8b3e14e0df7976eb00a9dbdb55e2d90d7f2a0e8c237e8518030496d34a'
    'ac6a4050f2f415a02f3c223ddee932a07de627bc143059e9a1ea9df088e46909'
    '7bb2d82dfffbd7a20df90cbe29d70eb8b0a95a8a934343f58f75a5617ee415e1'
)

package() {
    cd "$_pkgname-$pkgver-linux-x86_64"
    patch < ../use-system-libs.patch
    install -Dm0755 smolvm "$pkgdir/usr/bin/smolvm"
    install -Dm0755 smolvm-bin "$pkgdir/usr/bin/smolvm-bin"
    install -d "$pkgdir/usr/lib/smolvm/"
    cp -r agent-rootfs/ "$pkgdir/usr/lib/smolvm/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
}

# vim: ts=4 sw=4 et:
