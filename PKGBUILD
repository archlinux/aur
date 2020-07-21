# Maintainer: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
pkgname=fava-git
_name=${pkgname%-git}
pkgver=1.15.r11.g2f140b23
pkgrel=1
pkgdesc="Web interface for beancount"
arch=('any')
url="https://beancount.github.io/fava/"
license=('MIT')
groups=()
depends=('beancount>=2.3.0'
         'python>=3.6'
         'python-setuptools'
         'python-babel>=2.6.0'
         'python-cheroot'
         'python-flask-babel>=1.0.0'
         'python-flask>=0.10.1'
         'python-jinja>=2.10'
         'python-click'
         'python-markdown2>=2.3.0'
         'python-ply'
         'python-simplejson>=3.2.0'
         'python-werkzeug>=0.15.0')

optdepends=('python-pyexcel>=0.2.2: Spreadsheet (ODS/XLS/XLSX) support'
            'python-pyexcel-ods3>=0.1.1: ODS file support'
            'python-pyexcel-xls>=0.1.0: XLS file support'
            'python-pyexcel-xlsx>=0.1.0: XLSX file support')


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
