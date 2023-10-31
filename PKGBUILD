# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Antoine Viallon <antoine+aur@lesviallon.fr>

pkgname=mfoc-hardnested-git
pkgver=0.10.9.r171.a600743
pkgrel=2
pkgdesc="A fork of mfoc integrating hardnested code from the proxmark"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc-hardnested"
license=('GPL2')
depends=('libnfc>=1.7.0' 'xz' 'glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
options=(!ccache)

pkgver() {
    cd "$pkgname"
    printf "%s.r%s.%s" \
        "$(grep AC_INIT configure.ac | sed 's/.*\[\([0-9.]\+\)\].*/\1/')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    autoreconf -vis
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="${pkgdir}" install
}
