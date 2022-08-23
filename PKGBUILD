# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="bashmount"
pkgname="${_pkgname}-git"
pkgver=r210.9a15ab7
pkgrel=2
pkgdesc="Tool to mount and unmount removable media from the command-line."
arch=('any')
url="https://github.com/jamielinux/bashmount"
license=("GPL2")
makedepends=('git')
optdepends=('udisks2: remove media without sudo')
provides=("bashmount")
conflicts=("bashmount")
backup=('etc/bashmount.conf')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 bashmount "${pkgdir}/usr/bin/bashmount"
    install -Dm644 bashmount.conf "${pkgdir}/etc/bashmount.conf"
    gzip -c -9 bashmount.1 > bashmount.1.gz
    install -Dm644 bashmount.1.gz "${pkgdir}/usr/share/man/man1/bashmount.1.gz"
    install -dm755 "${pkgdir}/usr/share/doc/bashmount"
    install -m644 COPYING "${pkgdir}/usr/share/doc/bashmount/COPYING"
    install -m644 NEWS "${pkgdir}/usr/share/doc/bashmount/NEWS"
}
