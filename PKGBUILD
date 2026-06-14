# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm-bin
_pkgname=smolvm
pkgver=1.0.4
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
    '0e786caf4d3d31cbc7b60ba6de156596089f1f20f8fc864a3a3dc4e331c7c602'
    'ac6a4050f2f415a02f3c223ddee932a07de627bc143059e9a1ea9df088e46909'
    '7bb2d82dfffbd7a20df90cbe29d70eb8b0a95a8a934343f58f75a5617ee415e1'
)

package() {
    cd "$_pkgname-$pkgver-linux-x86_64"
    patch < ../use-system-libs.patch
    install -Dm0755 smolvm "$pkgdir/usr/bin/smolvm"
    install -Dm0755 smolvm-bin "$pkgdir/usr/bin/smolvm-bin"
    install -d "$pkgdir/usr/lib/smolvm/"
    install -Dm0755 init.krun "$pkgdir/usr/lib/smolvm/init.krun"
    cp -r agent-rootfs/ "$pkgdir/usr/lib/smolvm/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
}

# vim: ts=4 sw=4 et:
