# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fawltydeps"
pkgver=0.20.0
pkgrel=1
pkgdesc="Python dependency checker"
url="https://github.com/tweag/FawltyDeps"
license=("MIT")
arch=("any")
depends=("python"
         "python-importlib-metadata"
         "python-isort"
         "python-packaging"
         "python-pip-requirements-parser"
         "python-pydantic"
         "python-yaml"
         )
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('09c32c0f9ad08351f37edeb6b615d4d9c032527a5d49759102f7256866fdf5832ee8ffa68b2737ef72d1818849362a848db8ab072824376ae6993877f429f08b')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 0664 "LICENSE" "$pkgdir/usr/share/licenses/fawltydeps/LICENSE"
}
