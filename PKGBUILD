# Maintainer: Marc Gibb
pkgname=proton-command-center
pkgver=1.9.5
pkgrel=1
pkgdesc="Per-game launch options, Proton selection, DLSS DLL management, shader precompilation, and benchmarks for Steam on Linux"
arch=('any')
_repo=proton_command_center
url="https://github.com/mrcgibb9876-hash/proton_command_center"
license=('MIT')
depends=('python' 'xdg-utils' 'curl')
optdepends=(
    'steam: the storefront this manages (required in practice)'
    'mangohud: performance overlay toggle and benchmark tab'
    'gamescope: compositor wrapper toggle in the launch builder'
    'nvidia-utils: DLSS DLL management and driver-aware compile tracking'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33cd85f93df60ff96ed068a468bfa6cb9046dd011086e0cc1ef3567f7a432aaf')

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
