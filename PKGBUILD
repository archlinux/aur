# Maintainer: Sergey Khobta <hxss@ya.ru>

pipname=mpris-fakeplayer
pkgname=$pipname
pkgver=0.1.3
pkgrel=1
pkgdesc='Fake mpris player for activating bluez avrcp volume control'
arch=(any)
url='https://gitlab.com/hxss-linux/mpris-fakeplayer'
license=(MIT)
depends=('python' 'python-dbus-next')
optdepends=('python-systemd: systemd logging')
makedepends=('python-pip' 'curl' 'jq' 'findutils')
install='INSTALL'

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
