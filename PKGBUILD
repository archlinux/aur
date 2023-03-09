# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Antoine Viallon <antoine+aur@lesviallon.fr>

pkgname=mfoc-hardnested-git
pkgver=162.2c25bf0
pkgrel=1
pkgdesc="A fork of mfoc integrating hardnested code from the proxmark"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc-hardnested"
license=('GPL2')
depends=('libnfc>=1.7.0' 'xz')
makedepends=('git')
provides=('mfoc')
conflicts=('mfoc' 'mfoc-git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=(!ccache)

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vis
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
