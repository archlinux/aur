# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>
# Contributor : Axel Navarro <navarroaxel at gmail>

pkgname=pycharm-community-eap
pkgver=233.13135.26
_pkgver=2023.3.2
_eap=y
pkgrel=1

epoch=14
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build, Community Edition'
arch=('x86_64')
url=http://www.jetbrains.com/pycharm
license=('Apache')

makedepends=('cython' 'python-setuptools')
depends=('python' 'glib2' 'dbus' 'libdbusmenu-glib')
optdepends=('python2: Support for Python 2 language'
			'ipython: Alternative Python shell')

options=('!strip')

_filever="$([ $_eap = y ] && echo -n $pkgver || echo -n $_pkgver)"
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz"
        "pycharm-community-eap.desktop")
sha256sums=('3869ff5516c28cf5471d773019eaf1e18b85afc5abf2a2937357185939566e7d'
            'f76a04261fb91a8ede8859f6b46352bdeb92f79210a9fc87b5ac959063cb1715')


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
	ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-community-eap"
}

# vim: ts=4 sw=4 noet ft=PKGBUILD:
