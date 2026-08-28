# Maintainer: Marc Gibb
pkgname=proton-command-center
pkgver=1.26.2
pkgrel=1
pkgdesc="Per-game launch options, Proton selection, DLSS/FSR DLL management, native Ultra+ and RHI (ReShade/OptiScaler/DXVK) mod install, and controller navigation for Steam on Linux"
arch=('any')
_repo=proton_command_center
url="https://github.com/mrcgibb9876-hash/proton_command_center"
license=('MIT')
depends=('python' 'xdg-utils' 'curl')
optdepends=(
    'steam: the storefront this manages (required in practice)'
    'mangohud: performance overlay toggle'
    'nvidia-utils: DLSS DLL management and driver-aware compile tracking'
    '7zip: OptiScaler, DXVK Lilium HDR, and some shader packs (e.g. Lilium HDR Shaders) - all ship as .7z'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6dc545152dc86a9dd8ec7e68863f0b4598fe325965225ae29eed7af9f9738e78')

package() {
    cd "$srcdir/$_repo-$pkgver"

    install -Dm644 pcc.py     "$pkgdir/usr/share/$pkgname/pcc.py"
    install -Dm644 index.html "$pkgdir/usr/share/$pkgname/index.html"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 -t "$pkgdir/usr/share/$pkgname/optiscaler_inis" optiscaler_inis/*.ini

    install -Dm755 packaging/proton-command-center \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 packaging/proton-command-center.desktop \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 packaging/proton-command-center.service \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
