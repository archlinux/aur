Maintainer="baris-inandi"
pkgname=fe
pkgver=1.0.5
pkgrel=1
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPLv3')
depends=(bash sudo)
makedepends=(git go bash)
source=("git+$url")
md5sums=('SKIP')

package() {
	cd $pkgname
	mkdir -p ~/.config/paru/
	if [ ! -e /etc/paru.conf ]; then
		cp conf/paru.conf /etc/paru.conf
	fi
	cp -n conf/pacman.conf /etc/fepacman.conf
	if ! type "paru" > /dev/null; then
		echo "WARN: INSTALL PARU BEFORE USING FE"
	fi	
}

build() {
	cd $pkgname
	sudo rm -rf /usr/bin/fe
	sudo go build -o /usr/bin/fe
	sudo rm -rf fe
}
