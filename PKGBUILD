# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=stable-diffusion-ui
pkgver=2.4.13
pkgrel=1
pkgdesc="A simple 1-click way to install and use Stable Diffusion on your own computer."
arch=('i686' 'x86_64')
url='https://stable-diffusion-ui.github.io/'
source=('https://github.com/cmdr2/stable-diffusion-ui/releases/latest/download/stable-diffusion-ui-linux.zip')
license=('custom')
provides=('stable-diffusion-ui')
makedepends=()
md5sums=('SKIP')
install='stable-diffusion-ui.install'

build() {
	echo Do Androids Dream of Electric Sheep?
	cat >stable-diffusion-ui-server <<!
#!/bin/bash
cd /opt/stable-diffusion-ui
./start.sh
!
}

pkgver() {
	curl 'https://stable-diffusion-ui.github.io/docs/installation/' |
		grep 'stable-diffusion-ui-linux.zip' |
		awk -F \" '{print $2}' |
		grep -oE '[0-9]+\.[0-9]+\.[0-9]+'
}

package() {
	install -Dm644 stable-diffusion-ui/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 stable-diffusion-ui-server "$pkgdir/usr/bin/stable-diffusion-ui-server"

	mkdir -p "$pkgdir/opt/"
	cp -r "stable-diffusion-ui" "$pkgdir/opt/"
	chmod 777 "$pkgdir/opt/stable-diffusion-ui"
}
