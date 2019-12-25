# Maintainer: Leon Plickat <leonhenrik.plickat@stud.uni-goettingen.de>

pkgname=lavalauncher-git
pkgver=1.2
pkgrel=1
pkgdesc='A simple launcher panel for Wayland'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/lavalauncher'
license=(GPL3)
depends=(cairo wayland wayland-protocols scdoc)
makedepends=(git gcc make)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}" 'Makefile.patch')
sha256sums=('SKIP' '9015bf10858ff1743ef56d2661b14ddf929e09c3c9677be26477a41c90014655')

pkgver() {
	printf "1.1"
}

prepare()
{
	cd "${pkgname%-*}"
	patch -Np1 -i ../Makefile.patch
}

build()
{
	make -C "${pkgname%-*}"
}

package()
{
	make -C "${pkgname%-*}" PREFIX=/usr DESTDIR="$pkgdir/" install
}
