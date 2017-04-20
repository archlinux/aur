# Maintainer: Seppia <seppia@seppio.fish>
# Contributor: svalo <me@valo.space>

pkgname=dino-git
pkgver=r100.5c8275e
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dino/dino"
license=('GPLv3')
depends=('glib2>=2.38' 'gtk3>=3.22' 'gpgme' 'libgee>=0.10' 'libnotify' 'libgcrypt' 'sqlite')
makedepends=('git' 'cmake' 'vala>=0.30')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dino::git+https://github.com/dino/dino')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}/" install
}
