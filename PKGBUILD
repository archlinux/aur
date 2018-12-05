# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=raid-check-systemd
pkgver=4.1
pkgrel=1
_cent_rel=rc1_2
pkgdesc="Raid data scrubbing script with systemd timer to be used with mdadm."
arch=('any')
url="https://wiki.archlinux.org/index.php/RAID#Scrubbing"
license=('GPL')
depends=('mdadm' 'systemd')
conflicts=('raid-check')
source=("http://mirror.centos.org/centos/7/os/x86_64/Packages/mdadm-$pkgver-$_cent_rel.el7.x86_64.rpm"
        'raid-check.service'
        'raid-check.timer')
sha256sums=('d97c463666ce90798ade02468846d4e034a3fc26ecd1ae1d39c93072cb250234'
            '90db8f53984df9d7ab32fde09a853632e9d76cbd91224c0efd760406118af84b'
            '2a7677fb83b67f71cb626169746ccaf39417f2b291b4cbc5a264706fdb8cc8b2')
backup=('etc/conf.d/raid-check')
install="$pkgname.install"

build() {
    cd $srcdir
    sed -i 's|sysconfig|conf.d|g' 'usr/sbin/raid-check'
}

package() {
    install -Dm 755 "$srcdir/usr/sbin/raid-check" "$pkgdir/usr/bin/raid-check"
    install -Dm 644 "$srcdir/etc/sysconfig/raid-check" "$pkgdir/etc/conf.d/raid-check"

    install -Dm 644 "$srcdir/raid-check.service" "$pkgdir/usr/lib/systemd/system/raid-check.service"
    install -Dm 644 "$srcdir/raid-check.timer" "$pkgdir/usr/lib/systemd/system/raid-check.timer"
}
