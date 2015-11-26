# This PKGBUILD is maintained at: https://github.com/majewsky/system-configuration/tree/master/holo
pkgname='holo'
pkgver=0.9.0
pkgrel=2
pkgdesc='Minimalistic configuration management'
arch=('i686' 'x86_64')
url='http://holocm.org'
license=('GPL2')
depends=(
    # 'git'    # TODO: uncomment this for 0.10 release where holo uses git-diff for file diffs
    'fakeroot' # required for holo-build
    'pacman'   # required for holo-build pacman generator (and pulls in other required tools, e.g. bsdtar and xz)
    'shadow'   # required for holo users/groups provisioning
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/holo/releases/download/v${pkgver}/holo-${pkgver}.tar.gz")
md5sums=('b14333d0c83a58938a6c1b2b45db55ee')

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
