# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=accel-ppp-vlanmon-dkms-git
_pkgname=accel-ppp
pkgver=r1350.d682a0a
pkgrel=1
pkgdesc='Accel-ppp vlan_mon kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'gcc' 'make' 'lua51')
conflicts=('accel-ppp-ipoe-dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel')
source=('accel-ppp::git+git://git.code.sf.net/p/accel-ppp/code'
        'vlan_mon.conf'
        'dkms.conf')

md5sums=('SKIP'
         'dbc866b5799b904d9f0327b6eccd78bc'
         'cad83c31b06eaf122d1ce4bc495f0fe6')

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd "$srcdir/${_pkgname%-git}"
    install -dm755 "$pkgdir/usr/src"
    install -dm755 "$pkgdir/usr/lib/modules-load.d"
    cd drivers
    cp -r vlan_mon "$pkgdir/usr/src/accel-ppp-vlanmon-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-vlanmon-$pkgver/dkms.conf"
    install -Dm0644 "$srcdir/vlan_mon.conf" "$pkgdir/usr/lib/modules-load.d/vlan_mon.conf"
}

# vim:set ts=4 sw=4 et:
