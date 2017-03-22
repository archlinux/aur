pkgname='holo'
pkgver=1.3.1
pkgrel=2
pkgdesc='Minimalistic configuration management'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'git' # holo uses git-diff for file diffs
)
makedepends=('go' 'perl')
provides=(
    "holo-files=${pkgver}" # required for holo-build packages that have a holo-files dependency when there are files below /usr/share/holo/files
    'HOLO_API_VERSION=3'
)
backup=(
    'etc/holorc'
    'etc/holorc.d/10-files'
)
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1ec8795df0a5a579bdcf88875db10ccb016044865096fdbf38d6ae6ed590aa63')

options=('!strip') # binaries are already stripped inside the Makefile

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
