# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=mastodonpp-git
_pkgname=mastodonpp
pkgver=r335.cf43022
pkgrel=1
pkgdesc="mastodonpp is a C++ wrapper for the Mastodon and Pleroma APIs. It replaces mastodon-cpp."
arch=('x86_64')
url="https://schlomp.space/tastytea/mastodonpp.git"
license=('GPL')
groups=()
depends=('libcurl.so')
makedepends=('git' 'cmake')
optdepends=('doxygen: documentation' 'catch2: tests')
provides=('mastodonpp')
source=("${_pkgname}"::"git+https://schlomp.space/tastytea/mastodonpp.git")
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
