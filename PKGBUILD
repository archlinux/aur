# Maintainer: Brenden Davidson <davidson.brenden15@gmail.com>
pkgname=python-webpy
pkgver=0.51
pkgrel=3
pkgdesc="A web framework for Python"
arch=("any")
url="https://webpy.org/"
license=('custom')

_name=${pkgname#python-}

depends=(
	"python-cheroot>=6.0.0"
)

# checkdepends=(
# 	"python-pytest>=4.6.2"

# 	# Omitted to disable DB tests
# 	"python-dbutils"
# 	"python-pymysql>=0.9.3"
# 	"python-mysql-connector>=8.0.19"
# 	"python-psycopg2>=2.8.4"
# )

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/webpy/webpy/archive/$pkgver.tar.gz"
)
sha256sums=(
        "550ed5fb18c7626c578cc2119fd45a9a898b7815fc81a4ac85ae2ed383a0ec5f"
)

build() {
	cd "$_name-$pkgver"
	/usr/bin/python setup.py build
}

# Tests have been purposefully disabled due to them requiring a test database.
# check() {
# 	cd "$_name-$pkgver"
# 	py.test tests $*
# }

package() {
	cd "$_name-$pkgver"
	/usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Add license file to the package
	mkdir -p ${pkgdir}/usr/share/licences/${pkgname}/
	install ./LICENSE.txt ${pkgdir}/usr/share/licences/${pkgname}/license
}
