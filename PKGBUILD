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

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

prepare() {
    cd "${srcdir}/${srcname}"

    ./autogen.sh
    ./configure --prefix=/usr
}

build() {
    cd "${srcdir}/${srcname}"

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
}
