# Mantainer: Leonardo "drd" Idone <idone.leonardo@gmail.com>

pkgname=alacritty-circadian
pkgver=0.9.8
pkgrel=1
pkgdesc="Alacritty time/sun based theme switch daemon"
arch=(any)
url="https://github.com/Dr-Dd/alacritty-circadian"
license=(Apache)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
depends=("python-ruamel-yaml" "python-ruamel.yaml.clib" "python-astral" "python-tzlocal")
makedepends=("python-build" "python-pip" "python-setuptools")
sha256sums=(SKIP)

build() {
	cd "$pkgname-$pkgver"
	cp docs/alacritty-circadian.service $HOME/.config/systemd/user/alacritty-circadian.service
	cp -n docs/circadian.yaml.example $HOME/.config/alacritty/circadian.yaml
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
