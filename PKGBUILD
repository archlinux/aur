# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>
# Contributor: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=brotab
pkgname="${_pkgname}-git"
pkgver=r161.97a289d
pkgrel=1
pkgdesc="Control your browser's tabs from the command line"
arch=('any')
url="https://github.com/balta2ar/${_pkgname}"
license=('custom:MIT')
depends=('python' 'python-flask' 'python-requests' 'python-psutil')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

check() {
	cd "${srcdir}/${_pkgname}"
	pytest
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
