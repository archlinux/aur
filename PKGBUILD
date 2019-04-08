# Maintainer: Kr1ss <kr1ss.x@yandex.com>

pkgname=socialfish
pkgver=2.0
pkgrel=2
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
sha256sums_i686=('779c34132db40b700cf14a1d5b9ec55038f5c000c6c9ba20ba0128b91ee612d2')
sha256sums_x86_64=('045ac9f9fc95bdc9ea8113895c3c8f82e99b79350b16306d1af8883a498d8224')
sha256sums_armv7h=('b94563b5966a852b9ca079781cdfdaea613ae1fe28f7dd19567380ee96ca2bc0')
sha256sums_aarch64=('b62b3cdaec4b6546a0471a466f9f9516f7bd4ff6b33ab2264824ef18cc8ea62f')

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
