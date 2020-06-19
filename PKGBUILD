# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=python-hosts
_pypiname=${pkgname}
pkgver=1.0.0
pkgrel=2
pkgdesc='a hosts file manager library written in python'
arch=('any')
url='https://github.com/jonhadfield/python-hosts'
license=('MIT')
makedepends=('python-setuptools')
source=(
	"https://files.pythonhosted.org/packages/source/${_pypiname::1}/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
	'utils.patch'
)
md5sums=('8e9d1eb341fdf496cb0b976c39d1514a'
         'b2116bec5cf7e5e67eb4961a4e25f85f')
sha256sums=('850998704ba9025ce4c8ffd45dc4fbea2b5e30247bf3b574872ac5df90426b4d'
            '5be0f0749bd4070e66f5e3516df2986dd6a57c7886b583fa9ce5076f4dde3ed4')

prepare() {
	cd "${_pypiname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/utils.patch"
	python setup.py build
}

package() {
	cd "${_pypiname}-${pkgver}"

	python setup.py install \
		--optimize=1 \
		--prefix=/usr \
		--root=${pkgdir} \
		--skip-build

	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
