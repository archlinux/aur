# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=xapu-git
_pkgname="${pkgname%-git}"
pkgrel=1
pkgver=r6.ded109e
arch=('any')
url="https://xmpp-util.keyoxide.org/"
license=('AGPL-3.0-only')
depends=('conversejs-headless')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://codeberg.org/keyoxide/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	pkgdesc='Web-based XMPP/Jabber chat client written in javascript'
	backup=('usr/share/webapps/converse.js/fullscreen.html')

	install -dm755 "$pkgdir"/usr/share/webapps/"${_pkgname}"
	ln -s /usr/share/webapps/converse-headless.js/converse-headless.min.js "$pkgdir"/usr/share/webapps/"${_pkgname}"/converse-headless.min.js
	ln -s /usr/share/webapps/converse-headless.js/converse-headless.min.js.map "$pkgdir"/usr/share/webapps/"${_pkgname}"/converse-headless.min.js.map

	cd "${_pkgname}"
	install -Dm644 index.html script.js simple.min.css "$pkgdir"/usr/share/webapps/"${_pkgname}"/
}
