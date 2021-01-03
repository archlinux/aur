# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=folderpreview
pkgname=$pipname
pkgver=0.4.2
pkgrel=2
pkgdesc="Generates folder thumbs using child files thumbs"
arch=(any)
url="https://gitlab.com/hxss-linux/folderpreview"
license=(MIT)
depends=(
	'python-dbus-next'
	'python-pyxdg'
	'python-yaml'
	'python-parse'
	'python-gobject'
	'python-pyvips'
	'python-systemd'
	'python-colorlog'
	'tumbler'
)
makedepends=(
	'python-pip'
	'curl'
	'jq'
	'findutils'
)
install='INSTALL'
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
