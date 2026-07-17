# Maintainer: Marc Gibb
pkgname=proton-command-center
pkgver=1.14.4
pkgrel=1
pkgdesc="Per-game launch options, Proton selection, DLSS DLL management, MangoHud benchmarks, and controller navigation for Steam on Linux"
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
# Placeholder — regenerate with `updpkgsums` before every release.
# Deliberately a WRONG hash rather than 'SKIP': if it's forgotten, makepkg
# fails loudly with a validity check error instead of silently shipping a
# package with integrity checking disabled for every user who installs it.
sha256sums=('6ef814ad17eb3ef81ba8a59307954d2181fa1bc762c332ba6307a2f0b69d9328')

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
