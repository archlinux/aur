# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=alerta
pkgver=7.5.5
pkgrel=1
pkgdesc="A tool used to consolidate and de-duplicate alerts from multiple sources"
arch=('any')
url="https://github.com/alerta/alerta"
license=('APACHE')
makedepends=('python-setuptools')
depends=('python' 'python-bcrypt' 'python-cryptography' 'python-flask' 'python-flask-cors' 'python-flask-compress' 'python-pyjwt' 'python-pyparsing' 'python-dateutil' 'python-pytz' 'python-pyaml' 'python-requests' 'python-sentry_sdk' 'python-blinker' 'python-pymongo') 
optdepends=('python-psycopg2' 'postgresql' 'mongodb') 
source=("https://github.com/alerta/alerta/archive/v$pkgver.tar.gz"
	"${pkgname}d.service"
	"${pkgname}.sysusers")
sha256sums=('96825d1ece5cd0a6b8c3282e441a1be246751626b90166439fe6d7972757fb85'
            '4449acb346807229e4cbfeed68d9ba6006a165e65dec09487fb6e627088016c2'
            'f0a2f76266ba07275ab2baeab1497dfb2946305e85ae68e3b34dd14e2ac47423')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root "${pkgdir}"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -D -m644 "${srcdir}/${pkgname}d.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}d.service"
}
