pkgname='holo'
_actual_pkgver=1.0-beta.2
pkgver=${_actual_pkgver//-/}
pkgrel=3
pkgdesc='Minimalistic configuration management'
arch=('i686' 'x86_64')
url='http://holocm.org'
license=('GPL3')
depends=(
    'git' # holo-files uses git-diff for file diffs
)
makedepends=('go' 'perl')
provides=(
    "holo-files=${pkgver}" # required for holo-build packages that have a holo-files dependency when there are files below /usr/share/holo/files
    'HOLO_API_VERSION=1'
)
backup=(
    'etc/holorc'
)
source=("https://github.com/holocm/${pkgname}/archive/v${_actual_pkgver}.tar.gz")
md5sums=('c4e35e16a5069f05ac9144545bb196bf')

build() {
    cd "${srcdir}/${pkgname}-${_actual_pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${_actual_pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${_actual_pkgver}"
    make install DESTDIR="${pkgdir}"
}
