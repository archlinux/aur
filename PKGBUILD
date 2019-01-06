# Maintainer: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=fava-git
_name=${pkgname%-git}
pkgver=1.9.r29.g9e7c51af
pkgrel=1
pkgdesc=""
arch=('any')
url="https://beancount.github.io/fava/"
license=('MIT')
groups=()
depends=('beancount' # >=2.1.2, but beancount-hg doesn't provide a version.
         'python'
         'python-setuptools'
         'python-markdown2>=2.3.0'
         'python-flask-babel>=0.10.0'
         'python-simplejson>=2.3.0'
         'python-cheroot')

makedepends=('git'
             'nodejs'
             'npm')

provides=("${_name}")
conflicts=("${_name}" "beancount-fava-git")
replaces=("beancount-fava-git")
source=('git://github.com/beancount/fava.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_name}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_name}"
	make
	python setup.py build
}

package() {
	cd "$srcdir/${_name}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
