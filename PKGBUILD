# Maintainer: Kr1ss <kr1ss.x@yandex.com>


pkgname=socialfish

pkgver=2.0
pkgrel=3

pkgdesc='Educational phishing tool and information collector using ngrok'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url=https://github.com/UndeadSec/SocialFish
license=('BSD')

makedepends=('python-pip')
depends=('php' 'python-requests' 'python-wget' 'python-huepy')

source=("$url/archive/sharkNet.tar.gz")
source_i686=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip')
source_x86_64=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip')
source_armv7h=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip')
source_aarch64=('https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip')
sha256sums=('71bb69585c7cd54b2dbe5af265eecd255854f3741cd89ba7a326db123ab17a7c')
sha256sums_i686=('136673d9f46ecea7cd0d94d617f07d98fce24a99892d3324f9714c9e3df50c0f')
sha256sums_x86_64=('1761f150c5e1d210e8148a863441af4bf0f0ae413d205fdb3ce9db4a3454d504')
sha256sums_armv7h=('0e21e242858be513f70a22a2e5f40e5859275454f7b18d451ec30af4deba2dd2')
sha256sums_aarch64=('c5dc3050fbe6f98afaee8878c0d9c85d1c00da8f8dcd6aba067b356cf401b93e')


package() {
	cd "$srcdir/SocialFish-sharkNet"
	install -Dm755 SocialFish.py "$pkgdir/usr/lib/$pkgname/SocialFish.py"
	cp -r base core "$pkgdir/usr/lib/$pkgname/"
	install -m755 ../ngrok "$pkgdir/usr/lib/$pkgname/base/Server/"
	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$pkgname" <<-EOF
		#!/bin/sh

		cd /usr/lib/socialfish/
		python SocialFish.py
	EOF
	chmod 755 "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md Images/* -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
