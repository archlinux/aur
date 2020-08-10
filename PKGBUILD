#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
commit=2b928054c777dc59faa4a75396af34adc840f716
pkgver=42.${commit:0:7}
pkgrel=1
pkgdesc="An AUR helper with asp support."
arch=(any)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL v3')
depends=('pacman' 'asp' 'devtools' 'git' 'python3')
makedepends=('git')

source=("${pkgname}.tar.gz"::"https://github.com/lxgr-linux/buildaur/archive/${commit}.tar.gz")
md5sums=('SKIP')

# pkgver() {
# 	    cd "$pkgname"
# 	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
# }

package() {
	cd "$srcdir/$pkgname-$commit"
	install -dm755 "${pkgdir}/usr/share/buildaur"
	install -D -m644 blacklist "${pkgdir}/usr/share/buildaur"
	install -dm755 "${pkgdir}/etc/buildaur"
	install -dm755 "${pkgdir}/etc/buildaur/prehooks"
	install -dm755 "${pkgdir}/etc/buildaur/posthooks"
	install -dm755 "${pkgdir}/etc/buildaur/prerunhooks"
	install -dm755 "${pkgdir}/etc/buildaur/postrunhooks"
	install -dm755 "${pkgdir}/etc/buildaur/hooks"
	install -Dm0755 -t "$pkgdir/etc/buildaur/prehooks" ./prehooks/*
	install -m644 buildaur.conf "$pkgdir/etc/buildaur/"
	#install -Dm0755 -t "$pkgdir/etc/buildaur/posthooks" ./posthooks/*
	install -Dm0755 -t "$pkgdir/usr/bin" "buildaur"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
