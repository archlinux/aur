# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=socialfish
pkgver=2.0
pkgrel=1
pkgdesc='Educational phishing tool and information collector using ngrok'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/UndeadSec/SocialFish"
license=('BSD')

depends=('php' 'python-requests')
makedepends=('python-pip' 'python-setuptools')
provides=("$pkgname")
conflicts=("${pkgname}-git")

source=('https://github.com/UndeadSec/SocialFish/archive/sharkNet.tar.gz')
source_i686=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip')
source_x86_64=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip')
source_armv7h=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip')
source_aarch64=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip')
sha256sums=('71bb69585c7cd54b2dbe5af265eecd255854f3741cd89ba7a326db123ab17a7c')
sha256sums_i686=('120f3fc20ba376042d1eed56545de75e86435fece02c1a76bcbc40efccbe9ca7')
sha256sums_x86_64=('ff5926b1c141dbe9a005b642a10d819fc498a069d69588767a18349c521839dd')
sha256sums_armv7h=('2cef6b188b335649ac26cd3166c3522d8c8d033cfca5f5bfde7ed4b9e069fd11')
sha256sums_aarch64=('9f4e3d0689ddfd18802b93213fed356cd982107f78a4dadf684c266a438a8a39')

package() {
	cd "$srcdir/SocialFish-sharkNet"
	pip install --root="$pkgdir" wget==3.2 huepy==0.9.8.1
	install -Dm755 SocialFish.py "$pkgdir/usr/lib/$pkgname/SocialFish.py"
	cp -r base core "$pkgdir/usr/lib/$pkgname/"
	install -m755 ../ngrok "$pkgdir/usr/lib/$pkgname/base/Server/"
	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/socialfish" <<-EOF
		#!/bin/sh
		cd /usr/lib/socialfish/
		python SocialFish.py

	EOF
	chmod 755 "$pkgdir/usr/bin/socialfish"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
