# Maintainer: Emerold <emerald-foe-manor at duck dot com>
# Contributor: Muhammad <tjmnkrajyej at gmail dot com>

pkgname=odinls-bin
_pkgname_no_bin="${pkgname%-*}"
pkgver=dev_2026_10
_pkgver_hyphens="`echo $pkgver | tr _ -`"
pkgrel=1
pkgdesc='Language server and source code formatter for Odin'
arch=('x86_64')
url='https://github.com/DanielGavin/ols'
license=('MIT')
depends=('odin')
provides=("ols=$pkgver" "odinfmt=$pkgver")
conflicts=("$_pkgname_no_bin" 'ols' 'odinfmt')
source=("$url/releases/download/$_pkgver_hyphens/ols-$arch-unknown-linux-gnu.zip"
        "ols_LICENSE::https://raw.githubusercontent.com/DanielGavin/ols/refs/tags/$_pkgver_hyphens/LICENSE")
sha256sums=('1ee224fcd7b0818acf2e2160e5d4e380d89261d9d96328c9b0a1cb8cc193bb7f'
            'efa5894137f6f31af79aef423b8dc33a7709d14b2784f84ef2d04df6ebed82af')

package() {
    # install
    install -Dm755 "ols-$arch-unknown-linux-gnu" "$pkgdir/usr/lib/$_pkgname_no_bin/ols"
    install -Dm755 "odinfmt-$arch-unknown-linux-gnu" "$pkgdir/usr/lib/$_pkgname_no_bin/odinfmt"
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname_no_bin/builtin/" builtin/*

    # create symlinks in /usr/bin
    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/lib/$_pkgname_no_bin/ols" "$pkgdir/usr/bin/ols"
    ln -s "/usr/lib/$_pkgname_no_bin/odinfmt" "$pkgdir/usr/bin/odinfmt"

    # distribute license
    install -Dm644 ols_LICENSE "$pkgdir/usr/share/licenses/$_pkgname_no_bin/LICENSE"
}
