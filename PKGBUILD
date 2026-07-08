# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=greetd-dms-greeter-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='DankMaterialShell greeter for greetd (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('MIT')
depends=(
    'greetd'
    'quickshell'
)
optdepends=(
    'niri: Niri compositor support'
    'hyprland: Hyprland compositor support'
    'sway: Sway compositor support'
)
provides=('greetd-dms-greeter')
conflicts=('greetd-dms-greeter' 'greetd-dms-greeter-git')
backup=('etc/greetd/config.toml')
install=greetd-dms-greeter.install

source_x86_64=("dms-full-amd64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-amd64.tar.gz")
source_aarch64=("dms-full-arm64-${pkgver}.tar.gz::$url/releases/download/v$pkgver/dms-full-arm64.tar.gz")

sha256sums_x86_64=('fb7112590dbff32f44e3328ef00dd8cdec5f7080e322aefa0efc0943b11c4717')
sha256sums_aarch64=('c66f6d59ac971bd75a49651f796f2c0c7d0605fab98e89afa9d779ad753c98f0')

package() {
    cd "${srcdir}/dms"

    install -dm755 "$pkgdir/usr/share/quickshell/dms-greeter"
    cp -r ./* "$pkgdir/usr/share/quickshell/dms-greeter/"

    install -Dm755 "Modules/Greetd/assets/dms-greeter" "$pkgdir/usr/bin/dms-greeter"

    install -Dm644 "Modules/Greetd/README.md" "$pkgdir/usr/share/doc/dms-greeter/README.md"

    install -dm750 "$pkgdir/var/cache/dms-greeter"
}
