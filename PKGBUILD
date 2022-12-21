# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=spectre-meltdown-checker
pkgver=0.45
pkgrel=2
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad vulnerability/mitigation checker"
arch=('any')
url="https://github.com/speed47/spectre-meltdown-checker"
license=('GPL3')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/speed47/$pkgname/archive/v$pkgver.tar.gz"
    "fix-typo-devnull.patch::https://patch-diff.githubusercontent.com/raw/speed47/$pkgname/pull/442.patch"
)
b2sums=(
    '14d49f40458167ab9af04cc31c9a0b9f8cb5f1e9417f5ac0bab0290be01cf14a737c716d8d28873fee1870535c0b36a56dac2d39f2cc7a000d27f0643a94cff7'
    '2464e7fd250ffed0fd2e3188e855cd9c2101e020b43db59d987649a477af935ea402a3695a7fdc8f12a8d4b1b1ef086ebfb39a8dbf9a0fed134eca33746fb349'
)

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/fix-typo-devnull.patch"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 spectre-meltdown-checker.sh "$pkgdir/usr/bin/spectre-meltdown-checker"
}
