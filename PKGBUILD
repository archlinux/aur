# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: asator <aaron@duckpond.com>

_pkgname="python-glob2"
pkgname="${_pkgname}-git"
pkgver=20160728
pkgrel=1
pkgdesc="An extended version of Python's builtin glob module that can capture patterns and supports recursive wildcards"
arch=('any')
url="https://github.com/miracle2k/python-glob2"
license=('custom')
depends=('python' 'python2')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
provides=(${_pkgname})
conflicts=(${_pkgname})

source=('git+https://github.com/miracle2k/python-glob2.git')
md5sums=('SKIP')

pkgver(){
    cd ${srcdir}/python-glob2
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

check() {
    cd ${srcdir}/python-glob2

	msg '[DEBUG] Testing python 3'
	python ./setup.py test
	msg '[DEBUG] Testing python 2'
	python2 ./setup.py test
}

package() {
    cd ${srcdir}/python-glob2
    
    python2 ./setup.py install --root="$pkgdir/" --optimize=1
    python ./setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
