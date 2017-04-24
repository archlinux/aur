# Maintainer    : Dan Beste <dan.ray.beste@gmail.com>

pkgname='bcachefs-tools'
pkgver=r251.1b495cf
pkgrel=1
pkgdesc='Bcachefs filesystem utilities'
arch=('i686' 'x86_64')
url='http://bcachefs.org/'
license=('unknown')
makedepends=('git' 'libsodium' 'liburcu' 'libscrypt')
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

    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/man/man8/"
    install -m0755 bcachefs         "${pkgdir}/usr/bin/"
    install -m0755 fsck.bcachefs	"${pkgdir}/usr/bin/"
    install -m0755 mkfs.bcachefs	"${pkgdir}/usr/bin/"
    install -m0644 bcachefs.8       "${pkgdir}/usr/share/man/man8/"
}
