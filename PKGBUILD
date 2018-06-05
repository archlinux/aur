# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=antspy
pkgname=python-$_pkgname
pkgver=0.1.5
pkgrel=2
pkgdesc="Advanced Normalization Tools (ANTs) in Python"
arch=('any')
url="https://github.com/ANTsX/ANTsPy"
license=('apache')
depends=('python' 'python-numpy' 'python-webcolors' 'insight-toolkit')
optdepends=('python-plotly: surface rendering')
makedepends=('python-setuptools')
source=("ANTsPy-$pkgver::git+https://github.com/ANTsX/ANTsPy.git")
sha512sums=('SKIP')
# source=("https://github.com/ANTsX/ANTsPy/archive/v${pkgver}.tar.gz")
# sha512sums=('0d6a9bc0d33c8969ce95beca08a771fda5bdf73837c78840ec405c89787656e2cb40174706b9981eb31f02c9fae9db818c58acbbfa3c2f903dc6b7b33befa3ed')

# This commit includes some fixes that allow to compile against ITKv5
_release_commit=7a8796b5204fccb6158e79453cd781811c063b3d

package() {
	cd "$srcdir/ANTsPy-$pkgver"

	git checkout $_release_commit

	# Include a bugfix in the version of ANTs used, otherwise it will not compile
	sed -i '521s,1d5d805c8a2f29f71050488caa7314aae1ef1520,45c37d92c9855325ba9ba1fd5ee131d547d8efb6,' scripts/configure_ANTsPy.sh

	export ITK_DIR="/usr"

	python setup.py install --optimize=1 --root="${pkgdir}"
}
