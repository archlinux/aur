# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=angie-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='Actively developing fork of nginx aiming to keep it great with brand new extra functionality.'
arch=("x86_64" "aarch64")
url='https://en.angie.software/'
license=('BSD-2-Clause')

depends=(
	"bash"
	"glibc"
	"libxcrypt-compat"
	"openssl"
	"pcre2"
	"zlib"
)

backup=(
	"etc/angie/angie.conf"
	"etc/angie/fastcgi.conf"
	"etc/angie/fastcgi_params"
	"etc/angie/http.d/default.conf"
	"etc/angie/prometheus_all.conf"
	"etc/angie/scgi_params"
	"etc/angie/uwsgi_params"
	"etc/logrotate.d/angie"
)

source_aarch64=("https://download.angie.software/angie/ubuntu/24.04/pool/main/a/angie/angie_${pkgver}-1~noble_arm64.deb")
source_x86_64=("https://download.angie.software/angie/ubuntu/24.04/pool/main/a/angie/angie_${pkgver}-1~noble_amd64.deb")

sha256sums_x86_64=('6479277b9aa834a229f496ecb9bd317c5f54fc85235531b1ce1448e7665a8642')
sha256sums_aarch64=('2458e71c7c3d327928d0b2ffd93ab5adb146b86cbe092f95fc5ca9bae66baa14')

package() {

	tar xf "data.tar.zst" -C "$pkgdir"

	cd "${pkgdir}"
	mv "usr/sbin/" "usr/bin/"

	sed -e 's|\<user\s\+\w\+;|user http;|g' \
		-i "$pkgdir/etc/angie/angie.conf"

	install -Dm644 \
		"usr/share/doc/angie/copyright" \
		"usr/share/licenses/angie-bin/LICENSE"
}
