# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

## not building from source because this thing builds V8 from source
## which takes well over an hour and large amounts of disk space

pkgname=python-pyminiracer
pkgver=0.6.0
pkgrel=1
pkgdesc='Minimal, modern embedded V8 for Python'
arch=('x86_64')
url="https://github.com/sqreen/PyMiniRacer"
license=('ISC')
depends=('python')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/p/py-mini-racer/py_mini_racer-$pkgver-py2.py3-none-manylinux1_x86_64.whl")
noextract=("${source[@]}")
sha256sums=('42896c24968481dd953eeeb11de331f6870917811961c9b26ba09071e07180e2')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir/" --ignore-installed --no-deps *.whl
	local _site_packages="$(python -c 'from site import getsitepackages as g; print(g()[0])')"
	python -O -m compileall "$pkgdir/$_site_packages/pi_mini_racer/"
}
