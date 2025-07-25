# Maintainer: dimflix <dimflix.official@gmail.com>
# Updated with automatic SHA256 hash calculation
pkgname=meowrch-settings
pkgver=2.0.0
pkgrel=5
pkgdesc="System optimization settings for Meowrch distribution"
arch=('any')
url="https://github.com/meowrch/meowrch"
license=('MIT')
depends=('systemd' 'zram-generator' 'pipewire' 'earlyoom' 'pciutils')
optdepends=('nvidia-utils: for NVIDIA GPU optimizations'
            'amd-ucode: for AMD CPU microcode'
            'intel-ucode: for Intel CPU microcode'
            'hdparm: for HDD performance optimizations')
install=meowrch-settings.install
source=("$url/archive/refs/heads/v3.0.tar.gz")
sha256sums=('f5026f1f0a9af685638d40a343a7647795f88833cb072fbf4a067e99de1131df')

package() {
    cd "$srcdir/meowrch-3.0/aur-packages/meowrch-settings"
    
    # Copy organized structure 
    cp -r "etc" "$pkgdir/"
    cp -r "usr" "$pkgdir/"
    
    # Install systemd configuration files
    install -Dm644 "systemd-conf/system.conf.d/00-timeout.conf" "$pkgdir/etc/systemd/system.conf.d/00-timeout.conf"
    install -Dm644 "systemd-conf/system.conf.d/limits.conf" "$pkgdir/etc/systemd/system.conf.d/limits.conf"
    install -Dm644 "systemd-conf/journald.conf.d/00-journal-size.conf" "$pkgdir/etc/systemd/journald.conf.d/00-journal-size.conf"
}
