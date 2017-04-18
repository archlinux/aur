# Maintainer: Seppia <seppia@seppio.fish>
# Contributor: svalo <me@valo.space>

pkgname=dino-git
pkgver=r99.7e388fb
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dino/dino"
license=('GPLv3')
groups=()
depends=('glib2>=2.38' 'gtk3>=3.22' 'gpgme' 'libgee>=0.10' 'libnotify' 'openssl' 'sqlite')
makedepends=('git' 'cmake' 'vala>=0.30')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('dino::git+https://github.com/dino/dino')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./configure --prefix="/usr/"
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}/" install
}
