# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=accel-ppp-ipoe-dkms-git
_pkgname=accel-ppp
pkgver=r1350.d682a0a
pkgrel=1
pkgdesc='Accel-ppp ipoe kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'gcc' 'make' 'lua51')
replaces=('accel-ppp-ipoe-module' 'accel-ppp-ipoe-module-git' 'accel-ppp-ipoe-module-lts')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel')
source=('accel-ppp::git+git://git.code.sf.net/p/accel-ppp/code'
        'ipoe.conf'
        'dkms.conf')

md5sums=('SKIP'
         'ecf99787915602dcedef531d5f8c42c9'
         '62ed71ee1ee1c812d3cda24b72392dcd')

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd "$srcdir/${_pkgname%-git}"
    install -dm755 "$pkgdir/usr/src"
    install -dm755 "$pkgdir/usr/lib/modules-load.d"
    cd drivers
    cp -r ipoe "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver/dkms.conf"
    install -Dm0644 "$srcdir/ipoe.conf" "$pkgdir/usr/lib/modules-load.d/ipoe.conf"
}

# vim:set ts=4 sw=4 et:
