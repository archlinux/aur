# Maintainer: dringsim <dringsim@qq.com>
# Contributor: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-clr_loader
_name=${pkgname#python-}
pkgver=0.2.10
pkgrel=1
pkgdesc="Generic pure Python loader for .NET runtimes"
arch=('any')
url="https://github.com/pythonnet/clr-loader"
license=('MIT')
depends=('python' 'python-cffi')
makedepends=('python-setuptools' 'python-wheel' 'dotnet-sdk')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=('81f114afbc5005bafc5efe5af1341d400e22137e275b042a8979f3feb9fc9446')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
