# Maintainer: Giuseppe Nebbione <nebbionegiuseppe at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-kb-git
pkgver=0.1.3.r29.g6a083cf
pkgrel=1
pkgdesc="A command line minimalist knowledge base manager"
arch=(any)
url="https://github.com/gnebbia/kb"
license=('GPL3')
depends=('python-attrs' 'python-colored' 'python-setuptools' 'python-toml')
makedepends=('git')
checkdepends=('python-pytest-cov')
provides=('kb')
conflicts=('python-kb')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd kb
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd kb
    python setup.py build
}

check() {
    cd kb
    pytest -v
}

package() {
	cd kb
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
