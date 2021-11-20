# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=hxss.responsibility
pkgname=python-hxss-responsibility
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple implementation of chain of responsibilities pattern'
arch=(any)
url='https://gitlab.com/hxss-python/hxss.responsibility'
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
		--no-warn-script-location \
		--quiet

	python -O -m compileall "$pkgdir"

	install -Dm644 $(find $pkgdir -name LICENSE*) \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
