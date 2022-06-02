# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=cvechecker-git
pkgver=4.0.r25.g16ccb70
pkgrel=1
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="https://github.com/sjvermeu/cvechecker"
license=('GPL')
groups=('system')
depends=('libconfig>=1.3' 'sqlite3' 'wget' 'libxslt')
makedepends=('autoconf' 'make' 'gcc')
provides=('cvechecker')
conflicts=('cvechecker')
replaces=()
backup=()
options=()
install=cvechecker.install
noextract=()
source=("${pkgname}::git+https://github.com/sjvermeu/cvechecker.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g;s/^cvechecker.//'
}

build() {
    cd "${srcdir}/${pkgname}"

    autoreconf -ivf
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-sqlite3
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make DESTDIR="${pkgdir}" install
}
