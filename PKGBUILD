pkgname=python-adafruit-nrfutil-git
_pkgname=Adafruit_nRF52_nrfutil
pkgver=20220629.1361059
pkgrel=1
pkgdesc="Modified version of Nordic's nrfutil 0.5.x for use with the Adafruit Feather nRF52"
_url="github.com/adafruit/${_pkgname}"
url="https://${_url}"
arch=('any')
license=('BSD')
depends=( # Based on requirements.txt
	'python-pyserial>=2.7'
	'python-click>=5.1'
	'python-ecdsa>=0.13'
	'python-behave'
)
makedepends=('git')
source=("${_pkgname}::git+https://${_url}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dpm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
