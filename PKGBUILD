# Maintainer: seiuneko <chfsefefgesfen foxmail>

pkgname=python-cqhttp-git
pkgver=r30.1869819
pkgrel=1
pkgdesc='A Python SDK for CoolQ HTTP API plugin.'
arch=('any')
url='https://github.com/richardchien/python-cqhttp'
license=('MIT')
groups=('eqs')
depends=('python>=3.5' 'python-flask' 'python-requests' 'coolq-cqhttp-api')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"

	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${pkgname%-git}"

	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
