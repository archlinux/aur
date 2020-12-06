# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=mastorss-git
_pkgname=mastorss
_source=https://schlomp.space/tastytea/mastorss.git
pkgver=r278.baf3e20
pkgrel=1
pkgdesc="Automatically read RSS feeds and post the items via the Mastodon API. Does not support Atom at the moment."
arch=('x86_64')
url="https://schlomp.space/tastytea/mastorss.git"
license=('GPL')
depends=('mastodonpp' 'jsoncpp' 'boost-libs')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${_source}")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B "${_pkgname}/build" -S "${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	make -C "${_pkgname}/build"
}

package() {
    make -C "${_pkgname}/build" DESTDIR="$pkgdir" install
	install -D -m644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
