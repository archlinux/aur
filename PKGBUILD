# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="tootstream"
pkgver=0.3.3
pkgrel=1
pkgdesc="Text interface for the Mastodon social network"
arch=("any")
url="https://github.com/magicalraccoon/tootstream"
license=("MIT")
depends=(
	"python-mastodon"
	"python-humanize"
	"python-click"
	"python-colored"
	"python-emoji"
)
makedepends=("python-distribute")
source=("$pkgname-$pkgver.tar.gz::https://github.com/magicalraccoon/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8c311447246f3273901432aac6742a025ee6f12a119bcb761670cf725c609b83855afec4e99d1acc2b062943251e59cbe7942cc03d2935e0228dba9b3b56c54c')

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
