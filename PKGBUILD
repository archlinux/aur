# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=dncdbg-bin
_name=${pkgname%-bin}
pkgver=1.2.0
pkgrel=1
pkgdesc='Managed-code debugger for .NET applications with DAP support'
url='https://github.com/viewizard/dncdbg'
license=('MIT')
arch=('x86_64')
provides=('dncdbg')
conflicts=('dncdbg')
depends=(glibc gcc-libs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/viewizard/$_name/releases/download/v$pkgver/$_name-$pkgver-linux-x64.tar.gz"
        "$_name-$pkgver-LICENSE::https://raw.githubusercontent.com/viewizard/$_name/v$pkgver/LICENSE")

sha256sums=('f6242663f5bcd7e7be22a1ee7799f1447aae30b079e28e4542ee7850b3c4d626'
            'f6389b731c39a1698eb55a915f6a740ac1dbd6fe3a30c5ca0cc546f7ec706285')

prepare() {
    # some junk files from Apple?
    rm -f "$_name"/.*
}

package() {
    install -d "$pkgdir/opt/dncdbg"
    cp -a "dncdbg" "$pkgdir/opt"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/dncdbg/dncdbg "$pkgdir/usr/bin"

    install -Dm644 "$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
