# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=accel-ppp-ipoe-dkms-git
_pkgname=accel-ppp
pkgver=r1179.b8b91d8
pkgrel=1
pkgdesc='Accel-ppp ipoe kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'gcc' 'make')
provides=('accel-ppp-ipoe-module-git')
optdepends=('linux-headers')
source=('accel-ppp::git+git://git.code.sf.net/p/accel-ppp/code'
        'dkms.conf')

md5sums=('SKIP'
         '1af1d013743f7e67a84dd6605fc0045c')

install=accel-ppp-ipoe-dkms-git.install

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd "$srcdir/${_pkgname%-git}"
    install -dm755 "$pkgdir/usr/src"
    cd drivers
    cp -r ipoe "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver/dkms.conf"
}

# vim:set ts=4 sw=4 et:
