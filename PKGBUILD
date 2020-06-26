#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=22.8d40dcf
pkgrel=1
pkgdesc="An AUR helper"
arch=(any)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL v3')
depends=('pacman' 'asp' 'devtools')
makedepends=('git')

source=("$pkgname"::'git+https://github.com/lxgr-linux/buildaur.git')
md5sums=('SKIP')

pkgver() {
	    cd "$pkgname"
	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare(){
	cd "$srcdir/$pkgname"
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "${pkgdir}/usr/share/buildaur"
	install -D -m644 blacklist "${pkgdir}/usr/share/buildaur"
	install -dm755 "${pkgdir}/etc/buildaur"
	install -dm755 "${pkgdir}/etc/buildaur/prehooks"
	install -dm755 "${pkgdir}/etc/buildaur/posthooks"
	install -dm755 "${pkgdir}/etc/buildaur/hooks"
	install -Dm0755 -t "$pkgdir/etc/buildaur/prehooks" ./prehooks/*
	touch $pkgdir/etc/buildaur/buildaur.conf
	#install -Dm0755 -t "$pkgdir/etc/buildaur/posthooks" ./posthooks/*
	install -Dm0755 -t "$pkgdir/usr/bin" "buildaur"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
