# Maintainer: Emerold <emerald-foe-manor at duck dot com>
# Contributor: Muhammad <tjmnkrajyej at gmail dot com>

pkgname=odinls-bin
_pkgname_no_bin="${pkgname%-*}"
pkgver=dev_2026_02
_pkgver_hyphens="`echo $pkgver | tr _ -`"
pkgrel=2
pkgdesc='Language server and source code formatter for Odin'
arch=('x86_64')
url='https://github.com/DanielGavin/ols'
license=('MIT')
depends=('odin')
provides=("$_pkgname_no_bin=$pkgver" "odinfmt=$pkgver")
conflicts=("$_pkgname_no_bin" 'odinfmt')
source=("$url/releases/download/$_pkgver_hyphens/ols-$arch-unknown-linux-gnu.zip"
        "${_pkgname_no_bin}_LICENSE::https://raw.githubusercontent.com/DanielGavin/ols/refs/tags/$_pkgver_hyphens/LICENSE")
sha256sums=('a713064736034e9d08ff332a88a5f599f23fe6bae1b8f1af9242f3de65a26cc4'
            'efa5894137f6f31af79aef423b8dc33a7709d14b2784f84ef2d04df6ebed82af')

package() {
    install -Dm755 "ols-$arch-unknown-linux-gnu" "$pkgdir/usr/lib/$_pkgname_no_bin/ols"
    install -Dm755 "odinfmt-$arch-unknown-linux-gnu" "$pkgdir/usr/lib/$_pkgname_no_bin/odinfmt"
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname_no_bin/builtin/" builtin/*
    # symlinks in /usr/bin
    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/lib/$_pkgname_no_bin/ols" "$pkgdir/usr/bin/$_pkgname_no_bin"
    ln -s "/usr/lib/$_pkgname_no_bin/odinfmt" "$pkgdir/usr/bin/odinfmt"
    # distribute license
    install -Dm644 ${_pkgname_no_bin}_LICENSE "$pkgdir/usr/share/licenses/$_pkgname_no_bin/LICENSE"
}
