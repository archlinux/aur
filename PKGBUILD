# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=astroterm-bin
_name=${pkgname%-bin}
pkgver=1.2.0
pkgrel=1
pkgdesc='A planetarium for your terminal'
arch=(x86_64)
url='https://github.com/da-luce/astroterm'
license=(MIT)
depends=(glibc)
provides=($_name)
conflicts=($_name)
source=(LICENSE-$pkgver::https://raw.githubusercontent.com/da-luce/$_name/refs/tags/v$pkgver/LICENSE
        README-$pkgver.md::https://raw.githubusercontent.com/da-luce/$_name/refs/tags/v$pkgver/README.md)
source_x86_64=("$_name-$pkgver::$url/releases/download/v$pkgver/$_name-linux-x86_64")
sha256sums=('dcf125d76a777af20283b8cc797ded8d3eeb7d57a1ad1f642493a13764c60a29'
            '8046f8fcc9658218f3ba0ce8a3a143137b6170b4c9651ee0421f1453b6e698e7')
sha256sums_x86_64=('57a542bd37d01337a5dfd8582015a76c9949c0a514e4b9335e0c1aa44445b3df')

build() {
    chmod +x $_name-$pkgver
    ./$_name-$pkgver -B > $_name.bash
}

package() {
    install -Dm755 $_name-$pkgver "$pkgdir/usr/bin/$_name"
    install -Dm644 $_name.bash "$pkgdir/usr/share/bash-completion/completions/$_name"
    install -Dm644 README-$pkgver.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
