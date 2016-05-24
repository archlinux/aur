# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

# Unofficial repository (x86_64 and i686) available:
# Build scripts at: https://repo.celti.name/nuvolaplayer/
#
# # Both the packages and the database are signed:
# # `pacman-key --recv-keys 123C3F8B058A707F86643316FA682BD8910CF4EA`
# # `pacman-key --lsign-key 123C3F8B058A707F86643316FA682BD8910CF4EA`
# [nuvolaplayer]
# SigLevel = Required TrustedOnly
# Server = https://repo.celti.name/archlinux/$repo/$arch

pkgname=diorite-git
pkgver=0.3.0.r19.g885d3e6
pkgrel=1

arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Utility and widget library based on Glib and GTK3.'
url='https://tiliado.eu/diorite/'

source=("$pkgname::git+https://github.com/tiliado/diorite")
sha256sums=('SKIP')

depends=('gtk3')
makedepends=('git' 'python' 'vala')
optdepends=('python: For generating tests')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	./waf configure --prefix=/usr
	./waf build
}

package() {
	cd "${pkgname}"
	./waf install --destdir="${pkgdir}"
}
