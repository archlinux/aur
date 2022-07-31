Maintainer="baris-inandi"
pkgname=fe
pkgver=1.0.3
pkgrel=3
epoch=
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPLv3')
groups=()
depends=(bash sudo)
makedepends=(git go bash)
checkdepends=()
optdepends=()
provides=(fe)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd $pkgname
	mkdir -p ~/.config/paru/
	if [ ! -e /etc/paru.conf ]; then
		sudo cp conf/paru.conf /etc/paru.conf
	fi
	sudo cp -n conf/pacman.conf /etc/fepacman.conf
	if type "paru" > /dev/null; then
		git clone https://github.com/joehillen/paruz.git
		cd paruz
		sudo make install
		cd ..
		sudo rm -rf paruz
	else
		echo "WARN: INSTALL PARU BEFORE USING FE"
	fi
	sudo rm -rf /usr/bin/fe
	go build
	sudo mv fe /usr/bin/fe
	sudo rm -rf fe
}
