# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=desktop-notify
pkgname=$pipname
pkgver=1.3.2
pkgrel=1
pkgdesc='Util for sending desktop notifications over dbus'
arch=(any)
url='https://gitlab.com/hxss-linux/desktop-notify'
license=(MIT)
depends=('python' 'python-dbus-next')
makedepends=('python-pip' 'curl' 'jq' 'findutils')

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
		--quiet

	python -O -m compileall "$pkgdir"

	install -Dm644 $(find $pkgdir -name LICENSE*) \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
