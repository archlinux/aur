# Maintainer: Milan Opath <milan dot opath at gmail dot com>
pkgname=traildb-git
pkgver=0.6.r7.g3fb679f
pkgrel=1
arch=('x86_64')
pkgdesc='An efficient tool for storing and querying series of events'
depends=('judy' 'libarchive' 'pkg-config')
makedepends=('git')
provides=('tdb')
license=('MIT')
url='http://traildb.io'
source=("traildb::git+https://github.com/traildb/traildb.git")
sha1sums=('SKIP')

pkgver() {
    cd traildb
    GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
	printf '%s.r%s.g%s' \
		"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
		"$(git rev-list --count ${GITTAG}..)" \
		"$(git log -1 --format='%h')"
}

build() {
    cd traildb
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd traildb
    make DESTDIR="$pkgdir" install
}
