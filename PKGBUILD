# Maintainer: Arnaud Gissinger <agissing@student.42.fr>
pkgname=rofi-notion
pkgver=2.1.2
pkgrel=1
pkgdesc="Quickly create new Notion pages for your databases with rofi as GUI."
arch=('any')
url="https://github.com/mathix420/rofi-notion"
license=('MIT')
makedepends=('python>=3.9' 'python-setuptools')
provides=('rofi-notion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathix420/rofi-notion/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	rm .python-version
	python -m venv "$pkgname-$pkgver-aur"
	source $pkgname-$pkgver-aur/bin/activate
	pip install pyinstaller
	pip install .
	pyinstaller stub.py --onefile --clean -n ${pkgname}
	deactivate
	rm -r "$pkgname-$pkgver-aur"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "./dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
