# Maintainer: dimflix <dimflix.official@gmail.com>
# Updated with automatic SHA256 hash calculation
pkgname=meowrch-settings
pkgver=3.0
pkgrel=1
pkgdesc="System optimization settings for Meowrch distribution with dconf integration"
arch=('any')
url="https://github.com/meowrch/meowrch-settings"
license=('MIT')
depends=('systemd' 'zram-generator' 'pipewire' 'earlyoom' 'pciutils' 'dconf')
optdepends=('nvidia-utils: for NVIDIA GPU optimizations'
            'amd-ucode: for AMD CPU microcode'
            'intel-ucode: for Intel CPU microcode'
            'hdparm: for HDD performance optimizations')
install=meowrch-settings.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ebd6818eef538d72dc29ddadfbb0e15e322077a0d01df68bad3689d50eb5cdf')

package() {
    cd "$srcdir/meowrch-settings-$pkgver"
    
    # Copy organized structure
    cp -r "etc" "$pkgdir/"
    cp -r "usr" "$pkgdir/"
    
    # Install systemd configuration files
    install -Dm644 "systemd-conf/system.conf.d/00-timeout.conf" "$pkgdir/etc/systemd/system.conf.d/00-timeout.conf"
    install -Dm644 "systemd-conf/system.conf.d/limits.conf" "$pkgdir/etc/systemd/system.conf.d/limits.conf"
    install -Dm644 "systemd-conf/journald.conf.d/00-journal-size.conf" "$pkgdir/etc/systemd/journald.conf.d/00-journal-size.conf"
}
