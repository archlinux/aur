# Maintainer : Thor K. Høgås <thor alfasign roht period no>
pkgname=mutt-addressbook
pkgver=1.1.0
pkgrel=0
pkgdesc="An LDAP addressbook query for mutt"
arch=('any')
url="https://github.com/qsuscs/mutt-addressbook"

license=('custom:ISC')
# It doesn't make sense to use mutt-addressbook without mutt; so, thusly
depends=('python' 'python-ldap3')
makedepends=('python-setuptools')

optdepends=(
	'mutt: Client to use mutt-addressbook from'
	'neomutt: mutt-based client to use mutt-addressbook from'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("826ff8f47724674c303837850fc6004d61d8958ce8a4308c01eaaccedbbb5b45")

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

check() {
	cd "${pkgname}-${pkgver}"
	python setup.py test
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
