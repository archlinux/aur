pkgname='holo-users-groups'
pkgver=2.1.1
pkgrel=1
pkgdesc='Holo plugin for provisioning user accounts and groups'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'holo>=1.2'
    'holo<2.0'
    'shadow'
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c49399602ba008c3bd41db2739d525f0519abe8049bbaf292e24b42492b57840')
backup=(
    'etc/holorc.d/20-users-groups'
)

options=('!strip') # binaries are already stripped inside the Makefile

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
