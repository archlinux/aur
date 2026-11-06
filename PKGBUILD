# Maintainer: Sduniii <tobias@sduni.de>
pkgname=brscan5-longpaper-fix
pkgver=1.0.1
pkgrel=1
pkgdesc="SANE driver shim to enable long paper & receipt scanning up to 1.82m on Brother DS-740D and brscan5 scanners"
arch=('x86_64')
url="https://github.com/Sduniii/brscan5-longpaper-fix"
license=('MIT')
depends=('brscan5' 'sane')
makedepends=('gcc' 'make')
install=brother5-longpaper.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "brother5-longpaper.hook"
        "apply-patch.sh")
sha256sums=('d73acfe2f260256484aabc71e752de5ae715c358b2fb7884d2d8f3b19680cfa1'
            '3e1a557e14035e3540d9a9c64a7b2d68b172dba64d50080207ef37285fb6f634'
            'ae44262f8f5fe61788d8446a9eb02267dc554f35030f51d5abd706095b57f751')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 out/libbrother5_longpaper.so "$pkgdir/usr/lib/brother5-longpaper/libbrother5_longpaper.so"
    install -Dm755 scripts/scan-bon "$pkgdir/usr/bin/scan-bon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    cd "$srcdir"
    install -Dm755 apply-patch.sh "$pkgdir/usr/lib/brother5-longpaper/apply-patch.sh"
    install -Dm644 brother5-longpaper.hook "$pkgdir/usr/share/libalpm/hooks/brother5-longpaper.hook"
}
