# Maintainer: Seppia <seppia@seppio.fish>
# Contributor: svalo <me@valo.space>

pkgname=dino-git
pkgver=r58.d3005bc
pkgrel=2
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dino/dino"
license=('')
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
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/plugins"
	install -m755 build/dino "${pkgdir}/usr/bin/"
	install -m755 build/*.so "${pkgdir}/usr/lib/${pkgname%-git}/"
	install -m755 build/plugins/*.so "${pkgdir}/usr/lib/${pkgname%-git}/plugins/"
#   Not working as of now, references to /usr/local
#	make DESTDIR="${pkgdir}/" install
}
