# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fawltydeps"
pkgver=0.18.0
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
b2sums=('e1cf94f4a86ba1528cf1db45c5697f9c28c0de54537b0aa60257a77c80e938cdfb327de4402d16c4a9a14b67e4451c648de9c1b3789299f83a34073aae65083d')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 0664 "LICENSE" "$pkgdir/usr/share/licenses/fawltydeps/LICENSE"
}
