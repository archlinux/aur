# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

pkgname="python-torrequest"
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=4

pkgdesc='Simple Python interface for HTTP(s) requests over Tor'
arch=('any')
url='https://github.com/erdiaker/torrequest'
# url='https://pypi.org/project/torrequest'
license=('MIT')

depends=('python' 'python-stem' 'python-pysocks' 'python-requests')
makedepends=('python-setuptools')
options=(strip emptydirs zipman)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/erdiaker/torrequest/master/README.md")
sha256sums=('3745d4ea3ffda98d7a034363c787adb37aab77bdab40094a4d937392cd4dae82'
	'820c985c4c1e943d35b92091c7b07c68ec7a45bb93b21e2881a09f976fbe6df2')

build() {
	cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dvm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
