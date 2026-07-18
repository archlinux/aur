# Maintainer: Avenge Media LLC <avengemediallc at gmail dot com>
pkgname=greetd-dms-greeter-bin
pkgver=1.5.2
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

sha256sums_x86_64=('4469218d2d5dc11aab1c11e926807eb23ff7d549454fa8a7df67d1c13d0850ec')
sha256sums_aarch64=('116d994733f67221bab2097a2edace0aef04a11b719a0d9f51a984ea4d118206')

package() {
    cd "${srcdir}/dms"

    install -dm755 "$pkgdir/usr/share/quickshell/dms-greeter"
    cp -r ./* "$pkgdir/usr/share/quickshell/dms-greeter/"

    install -Dm755 "Modules/Greetd/assets/dms-greeter" "$pkgdir/usr/bin/dms-greeter"

    install -Dm644 "Modules/Greetd/README.md" "$pkgdir/usr/share/doc/dms-greeter/README.md"

    install -dm750 "$pkgdir/var/cache/dms-greeter"
}
