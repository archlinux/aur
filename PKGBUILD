# Maintainer: Jona Miller <miller.jona at yandex dot com>
pkgname=onhold-git
pkgver=0.6.4.r6.ga15d8ca
pkgrel=1
pkgdesc="A command-line utility that allows you to play music while a long job completes"
arch=('any')
url="https://github.com/alexdelorenzo/onhold"
license=('AGPL3')
depends=('python>=3.6.0')
makedepends=('python-pip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver() {
   cd "${srcdir}/${pkgname}"
   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	python3 -m pip install -r requirements.txt
}

build() {
	cd "${srcdir}/${pkgname}"
	python3 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm644 ./README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  	install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
