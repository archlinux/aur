pkgname=('simple-mtpfs-git')
_srcname='simple-mtpfs'
pkgver='r1'
pkgrel='1'
pkgdesc='Simple MTP fuse filesystem driver'
arch=('i686' 'x86_64')
url="https://github.com/phatina/${_srcname}"
license=('GPL2')

depends=('libmtp' 'fuse' 'gcc-libs')
makedepends=('git')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${_srcname}"

    autoreconf --install --force --warnings='all'
    ./configure --prefix='/usr'

    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
}
