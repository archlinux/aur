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
sha256sums=('a6dc3f72c00c8f1357eb3588f2723e12b473f1aa51c5a6466311d4ee39932fdb')

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
