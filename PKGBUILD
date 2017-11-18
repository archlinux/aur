# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="tootstream"
pkgver=0.3.0
pkgrel=1
pkgdesc="Text interface for the Mastodon social network"
arch=("any")
url="https://github.com/magicalraccoon/tootstream"
license=("MIT")
depends=("python-mastodon" "python-humanize" "python-click" "python-colored")
makedepends=("python-distribute")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magicalraccoon/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('99465fd3068475d6c047f16361e9ec0f758d338675f2c39fd05a0fb38e05230ec875bf8f0f6a352ece150c64689f9df7ffc37f49fadc5c2ca971519100486f8a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    sed -ie 's/colored==1\.3\.4/colored/g' requirements.txt
    sed -ie 's/click==6.6/click/g' requirements.txt
	python ./setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
