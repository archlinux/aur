# Maintainer: Leonardo Hernández <leohdz172@outlook.com>

pkgname=pycritty
pkgver=0.3.5
pkgrel=1
pkgdesc='CLI program that allows you to change your Alacritty config with one command without editing the config file.'
url='https://github.com/antoniosarosi/pycritty'
arch=('any')
license=('MIT')
depends=('python')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f0eafd34223fce6f05f75ca21a1054d2feae0841933a9b859ebe9c8adc5a0231c421bf72effd1013eeae3b6befb63cecf5bed7e94d31e6cb9acf32ea7a1a3992')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

check() {
	cd $pkgname-$pkgver
	python -B setup.py test
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}
