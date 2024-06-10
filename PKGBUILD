# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>
# Contributor : Axel Navarro <navarroaxel at gmail>

pkgname=pycharm-community-eap
pkgver=242.14146.24
_pkgver=2024.2
_eap=y
pkgrel=1

epoch=14
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build, Community Edition'
arch=('x86_64' 'aarch64')
url=http://www.jetbrains.com/pycharm
license=('Apache')

makedepends=('cython' 'python-setuptools')
depends=('python' 'glib2' 'dbus' 'libdbusmenu-glib')
optdepends=('python2: Support for Python 2 language'
			'ipython: Alternative Python shell')

options=('!strip')

_filever="$([ $_eap = y ] && echo -n $pkgver || echo -n $_pkgver)"
source=("pycharm-community-eap.desktop")
sha256sums=('5996ba03e5f4d7be7c6f002a1294b97674cb4b6d0f8b3777bc67e255ad20ff85')
sha256sums_x86_64=('901af8e549029c0ed78955e3dc07155b1ca5e81daa2a13835aa3e4bd13cef2ec')
sha256sums_aarch64=('497ae345c7ecff6b54eaadc93e4533cdb6c29f3c74290591d9e78571292093f8')

source_x86_64=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz")

source_aarch64=("https://download.jetbrains.com/python/pycharm-community-$_filever-aarch64.tar.gz")

prepare() {
	if [ -d "pycharm-community-$_pkgver" ]; then
		mv pycharm-community-{"$_pkgver","$pkgver"}
	fi
}

package() {
	install -dm755 "$pkgdir"/{opt,usr/{bin,share/pixmaps}}
	cp -R "pycharm-community-$pkgver" "$pkgdir/opt/$pkgname"

	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

	ln -sf "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/pycharm-community-eap.png"
	ln -s "/opt/${pkgname}/bin/pycharm" "${pkgdir}/usr/bin/pycharm-community-eap"
}

# vim: ts=4 sw=4 noet ft=PKGBUILD:
