# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>
# Contributor : Axel Navarro <navarroaxel at gmail>

pkgname=pycharm-community-eap
pkgver=243.15521.16
_pkgver=2024.3
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
sha256sums_x86_64=('3d0c99ae6d9dc374c465558aef8eb5f080cde7e60aa10652a66a14cbf8e29cb3')
sha256sums_aarch64=('d408aa059c5f252750aab3c4c0484d49e7c659b80b1e78fa01156647dbd807f6')

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
