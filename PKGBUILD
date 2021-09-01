# Maintainer: Luca Sciullo <lukesmolo at gmail dot com>

pkgname=thingweb.node-wot
pkgver=0.7.7
pkgrel=1
pkgdesc='W3C Web of Things implementation on NodeJS.'
arch=('i686' 'x86_64')
url='https://github.com/eclipse/thingweb.node-wot'
license=('Eclipse Public License v. 2.0')
depends=('nodejs')
makedepends=('npm')
_components=(
	'cli'
	'core'
	'binding-http'
	'binding-coap'
	'binding-mqtt'
	'binding-file'
	'binding-opcua'
	'binding-fujitsu'
	'binding-modbus'
	'binding-netconf'
	'binding-oracle'
	'binding-websockets'
	'td-tools'
	'browser-bundle'
)

source=()
noextract=()
sha256sums=()
for _c in "${_components[@]}"
do
	_npmname=@node-wot/$_c
	_npmcomponent=$_c
	source+=("https://registry.npmjs.org/$_npmname/-/$_npmcomponent-$pkgver.tgz")
	noextract+=($_npmname-$pkgver.tgz)
	sha256sums+=('SKIP')
done

package() {
	cd "$srcdir"
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	for _c in "${_components[@]}"
	do
		_npmname=@node-wot/$_c
		_npmcomponent=$_c
		npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmcomponent-$pkgver.tgz"
	done
	chown -R root:root "${pkgdir}"
}
