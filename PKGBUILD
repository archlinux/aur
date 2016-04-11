pkgname='holo'
pkgver=1.1.1
pkgrel=1
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
)
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('6361f5b069479d55bb15d840ac0d501d')

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
