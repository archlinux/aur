# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Chris Cromer <chris@cromer.cl>

_url="https://github.com/arch-openrc/opensysusers/archive"

pkgname=opensysusers
pkgver=0.4.5
pkgrel=1
pkgdesc="A standalone utility for handling systemd-style sysusers.d users and groups"
arch=('any')
url="https://github.com/artix-linux/opensysusers"
license=('custom:BSD2')
depends=('shadow' 'openrc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/artix-linux/opensysusers/archive/$pkgver.tar.gz"
        'opensysusers.hook')
sha256sums=('b0dc09caf5f97a2e9156716809e74835d0fecbf0432c6cec4626a943e8e58bd4'
            '90fdf362a29138f1ed65e86e8b97d1251adb6b2e94d829cceb0094a63d00252a')

       
build() {
    cd $pkgname-$pkgver
    make PREFIX="/usr" SYSTEMDCOMPAT=FALSE
}
            
package() {
	cd $pkgname-$pkgver
	make PREFIX="/usr" SYSTEMDCOMPAT=FALSE DESTDIR="$pkgdir" install
	install -Dm755 openrc/opensysusers.initd "$pkgdir"/etc/openrc/init.d/opensysusers
	install -Dm644 "$srcdir"/opensysusers.hook "$pkgdir"/usr/share/libalpm/hooks/opensysusers.hook
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/opensysusers/license
}
