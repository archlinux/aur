# Maintainer: dimflix <dimflix.official@gmail.com>
# Updated with automatic SHA256 hash calculation
pkgname=meowrch-settings
pkgver=2.0.0
pkgrel=9
pkgdesc="System optimization settings for Meowrch distribution with dconf integration"
arch=('any')
url="https://github.com/meowrch/meowrch"
license=('MIT')
depends=('systemd' 'zram-generator' 'pipewire' 'earlyoom' 'pciutils' 'dconf')
optdepends=('nvidia-utils: for NVIDIA GPU optimizations'
            'amd-ucode: for AMD CPU microcode'
            'intel-ucode: for Intel CPU microcode'
            'hdparm: for HDD performance optimizations')
install=meowrch-settings.install
source=("meowrch-settings-2.0.0-9.tar.gz::$url/archive/refs/heads/v3.0.tar.gz")
sha256sums=('d76ea0985d68d45d03349bd0f8a2ba87d8ac82966e597e95307d1c55ba8e13dd')

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
