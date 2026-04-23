# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm-bin
_pkgname=smolvm
pkgver=0.5.20
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=('libkrun' 'libkrunfw')
makedepnds=('patch')
options=(!debug)
provides=('smolvm')
conflicts=('smolvm-git' 'smolvm')
source=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/smol-machines/$_pkgname/refs/tags/v$pkgver/LICENSE"
    'use-system-libs.patch')
sha256sums=('68431f36711c27dbb989e9ca55f42188a5788faab95a965a3f126481248efc1a'
            'ac6a4050f2f415a02f3c223ddee932a07de627bc143059e9a1ea9df088e46909'
            'a64059e9dacb770103a0edec5e8bb11dcd954d688f688d03bb2ade53a17d5f0b')

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
