# Maintainer: Emerold <emerald-foe-manor at duck dot com>
# Contributor: Muhammad <tjmnkrajyej at gmail dot com>

pkgname=odinls-bin
_pkgname_no_bin="${pkgname%-*}"
pkgver=dev_2025_11
_pkgver_hyphens="`echo $pkgver | tr _ -`"
pkgrel=2
pkgdesc='ols: Language server for Odin'
arch=('x86_64')
url='https://github.com/DanielGavin/ols'
license=('MIT')
depends=('odin')
optdepends=('odinfmt: Odin source code formatter')
provides=("$_pkgname_no_bin=$pkgver")
conflicts=("$_pkgname_no_bin")
source=("$url/releases/download/$_pkgver_hyphens/ols-$arch-unknown-linux-gnu.zip"
        "${_pkgname_no_bin}_LICENSE::https://raw.githubusercontent.com/DanielGavin/ols/refs/tags/$_pkgver_hyphens/LICENSE")
sha256sums=('cbb7b958291c686b27762875c412b4d440c6cad294021f41f960a32d84670ba8'
            'efa5894137f6f31af79aef423b8dc33a7709d14b2784f84ef2d04df6ebed82af')

package() {
    install -Dm755 "ols-$arch-unknown-linux-gnu" "$pkgdir/usr/lib/$_pkgname_no_bin/ols"
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname_no_bin/builtin/" builtin/*
    install -dm755 "$pkgdir/usr/bin/"
    # symlink in /usr/bin
    ln -s "/usr/lib/$_pkgname_no_bin/ols" "$pkgdir/usr/bin/$_pkgname_no_bin"
    install -Dm644 ${_pkgname_no_bin}_LICENSE "$pkgdir/usr/share/licenses/$_pkgname_no_bin/LICENSE"
}
