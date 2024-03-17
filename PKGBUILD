# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=keeprofi
pkgname=$pipname
pkgver=2.0.2
pkgrel=1
pkgdesc="Fast rofi drun menu for keepass database"
arch=(any)
url="https://gitlab.com/hxss-linux/keeprofi"
license=(MIT)
depends=(
	'python-pyxdg'
	'python-yaml'
	'python-xerox'
	'python-pynput'
	'python-pykeepass'
	'python-keyring'
	'python-hxss-responsibility'
	'rofi'
	'xclip'
	'desktop-notify'
)
makedepends=(
	'python-pip'
	'curl'
	'jq'
	'findutils'
)
provides=($pipname)

pkgver() {
	curl -s https://pypi.org/pypi/$pipname/json | jq -r .info.version
}

package() {
	PIP_CONFIG_FILE=/dev/null pip install $pipname \
		--root=$pkgdir \
		--isolated \
		--no-user \
		--no-deps \
		--ignore-installed \
		--no-warn-script-location \
		--quiet

	python -O -m compileall "$pkgdir"

	install -Dm644 $(find $pkgdir -name LICENSE*) \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
