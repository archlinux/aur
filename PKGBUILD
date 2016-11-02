# Maintainer: Peter Wu <peter@lekensteyn.nl>
# Contributor: Adrien Sohier <adrien.sohier@art-software.fr>
pkgname=ltunify-git
pkgver=0.2.22.gc3a263f
pkgrel=2
pkgdesc="A command-line tool to pair Logitech Unifying devices"
arch=('i686' 'x86_64' 'ARM')
url="https://lekensteyn.nl"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=('git+https://git.lekensteyn.nl/ltunify.git')
md5sums=('SKIP')
changelog='NEWS'
_gitname='ltunify'

pkgver() {
	cd "$_gitname"
	git describe --always | sed 's|^v||;s|-|.|g'
}

build() {
	cd "$_gitname"
	make ltunify
}

package() {
	cd "$_gitname"
	install -Dm755 ltunify "$pkgdir/usr/bin/ltunify"
	install -Dm644 udev/42-logitech-unify-permissions.rules \
		"$pkgdir/usr/lib/udev/rules.d/42-ltunify-permissions.rules"
}
