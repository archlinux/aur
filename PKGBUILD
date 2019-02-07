pkgname=transmission-web-control-git
pkgver=1.6.0.beta2.r31.g50bcc1d
pkgrel=2
pkgdesc='A custom web UI for transmission-da'
arch=(any)
url='https://github.com/ronggang/transmission-web-control'
license=('MIT')
source=("git+${url}")
makedepends=('git')
sha1sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-*}"

	install -dm755 "$pkgdir"/usr/share/transmission/web/
	cp -r src/{favicon.ico,index.mobile.html,tr-web-control} "$pkgdir"/usr/share/transmission/web/
	install -m644 src/index.html "$pkgdir"/usr/share/transmission/web/index.new.html
	install -pDm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
