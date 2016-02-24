pkgname=('simple-mtpfs-git')
srcname='simple-mtpfs'
pkgver='r1'
pkgrel='1'
pkgdesc='Simple MTP fuse filesystem driver'
arch=('i686' 'x86_64')
url='https://github.com/phatina/simple-mtpfs'
license=('GPL2')

depends=('libmtp' 'fuse' 'gcc-libs')
makedepends=('git')
provides=('simple-mtpfs')
conflicts=('simple-mtpfs')

source=("${srcname}::git+https://github.com/phatina/simple-mtpfs.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

build() {
    cd "${srcdir}/${srcname}"

    autoreconf --install --force --warnings='all'
    ./configure --prefix='/usr'

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
}
