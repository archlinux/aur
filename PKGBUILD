# Maintainer    : Dan Beste <dan.ray.beste@gmail.com>

pkgname='bcachefs-tools'
pkgver=r263.38f2216
pkgrel=1
pkgdesc='Bcachefs filesystem utilities'
arch=('i686' 'x86_64')
url='http://bcachefs.org/'
license=('unknown')
makedepends=('git' 'libsodium' 'liburcu' 'libscrypt-git')
optdepends=('libscrypt: Currently broken with some makeflags')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git+https://evilpiepirate.org/git/bcachefs-tools.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"

    make
}

package() {
    cd "${pkgname}"

    make                        \
        DESTDIR="${pkgdir}/usr" \
        ROOT_SBINDIR=/bin       \
        install
}
