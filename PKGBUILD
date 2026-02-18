# Maintainer: Matteo Turri <matteoturri89@gmail.com>
pkgname=toshiba-satellite-u940-kbdlight-dkms
pkgver=1.0.0
pkgrel=2
_kver=6.18
pkgdesc="Toshiba Satellite U940 keyboard backlight 3-mode cycling (OFF/AUTO/ON) via Fn+Z"
arch=('any')
url="https://aur.archlinux.org/packages/toshiba-satellite-u940-kbdlight-dkms"
license=('GPL-2.0-only')
depends=('dkms')
source=('dkms.conf'
        'Makefile'
        "toshiba_acpi.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/platform/x86/toshiba_acpi.c?h=v${_kver}"
        'kbdlight-cycle.patch')
sha256sums=('c8126844fefbb98cf9059245d8eb6a425d1c264fedbb6ad4e1fca8882d795755'
            '90a6f72c18dd1a492f3732b278bb416fea2297fef66bd045807634885fd99e5d'
            '048755a3ebaaaa5fd5203d92fa577cccc9f062e193cbd982144e35c3a2eb6c2d'
            'd40e8230c15221bf9cf7fd2d2bae46b7992e9f2635dcae513f0320749f6baabb')

prepare() {
    sed -i "s/@PKGVER@/$pkgver/" dkms.conf
    patch --follow-symlinks -p1 -i kbdlight-cycle.patch
}

package() {
    local _dkmsname="toshiba-satellite-u940-kbdlight"
    local dest="$pkgdir/usr/src/$_dkmsname-$pkgver"
    install -Dm644 dkms.conf "$dest/dkms.conf"
    install -Dm644 Makefile "$dest/Makefile"
    install -Dm644 toshiba_acpi.c "$dest/toshiba_acpi.c"
}
