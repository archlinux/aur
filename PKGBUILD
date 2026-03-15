# Maintainer: Jack Reitano <thnikk645@gmail.com>
pkgname=pybar-bin
_pkgname=pybar
pkgver=2.0.0
pkgrel=1
pkgdesc="Statusbar for Sway and Hyprland"
arch=('x86_64')
url="https://github.com/thnikk/pybar"
license=('MIT')
depends=(gtk4-layer-shell)
optdepends=(
    'libpulse: for volume module'
    'libvirt: for virtual machine module'
    'git: for git module'
    'docker: for docker module'
    'networkmanager: for network module'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/pybar-arch.zip")
sha256sums=('fbc2a6be62750dced79db44c782c6b63ffded9aba4e51ecc83534757dfd494c2')

package() {
    # Install the application support files
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -dr --no-preserve=ownership "$srcdir/_internal" "$pkgdir/opt/$_pkgname/"

    # Install the binary with correct executable permissions
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"

    # Create symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    # Install the license from the source archive
    install -Dm644 "$srcdir/_internal/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
