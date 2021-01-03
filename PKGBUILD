# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=keeprofi
pkgname=$pipname
pkgver=1.1.1
pkgrel=1
pkgdesc="Access to keepass database using rofi drun menu"
arch=(any)
url="https://gitlab.com/hxss-linux/keeprofi"
license=(MIT)
depends=(
	'python-pyxdg'
	'python-xerox'
	'python-pynput'
	'python-pykeepass'
	'python-keyring'
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
