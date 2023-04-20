pkgname=nginx-totp-auth
pkgver=r16.09bf6d9
pkgrel=1
pkgdesc="totp auth for nginx"
arch=(x86_64 i686)
url="https://github.com/davidgfnet/nginx_totp_auth"
license=('')
depends=('spawn-fcgi' 'fcgi' 'libconfig' 'openssl')
makedepends=('git' 'python')
source=('git+https://github.com/davidgfnet/nginx_totp_auth.git'
	'nginx-totp-auth.service')
sha256sums=('SKIP'
            'cf63954266f7f0baa4d193a574535f5b222395d512c5fb50640267b4c6d9665b')

pkgver() {
	cd "$srcdir/nginx_totp_auth"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/nginx_totp_auth"
	make
}

package() {
	cd "$srcdir/nginx_totp_auth"
	install -Dm0755 server.bin "$pkgdir"/usr/lib/$pkgname/$pkgname.bin
	install -Dm0644 nginx.config.sample "$pkgdir"/etc/$pkgname.conf
	install -Dm0644 ../nginx-totp-auth.service "$pkgdir"/usr/lib/systemd/system/nginx-totp-auth.service
}
