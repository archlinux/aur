# Maintainer: Marc Gibb
pkgname=proton-command-center
pkgver=1.3.4
pkgrel=1
pkgdesc="Per-game launch options, Proton selection, DLSS DLL management, shader precompilation, and benchmarks for Steam on Linux"
arch=('any')
_repo=proton_command_centre
url="https://github.com/mrcgibb9876-hash/proton_command_centre"
license=('MIT')
depends=('python' 'xdg-utils' 'curl')
optdepends=(
    'steam: the storefront this manages (required in practice)'
    'mangohud: performance overlay toggle and benchmark tab'
    'gamescope: compositor wrapper toggle in the launch builder'
    'nvidia-utils: DLSS DLL management and driver-aware compile tracking'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f59ec6eda5b13ce07e66a8222fa7de446cda1c33c74a1b5e0cd9d5f21c7a8bd')

package() {
    cd "$srcdir/$_repo-$pkgver"

    install -Dm644 pcc.py     "$pkgdir/usr/share/$pkgname/pcc.py"
    install -Dm644 index.html "$pkgdir/usr/share/$pkgname/index.html"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 packaging/proton-command-center \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 packaging/proton-command-center.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 packaging/proton-command-center.service \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
