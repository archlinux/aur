# Maintainer: Alexey Ermakov <fufler[at]gmail[dot]com>

pkgname=gnupod-git
_pkgname=gnupod
pkgver=520.a3f4c9c
pkgrel=1
pkgdesc="GNUpod is a collection of tools which allow you to use your iPod under GNU/Linux and other UNIX-like operating systems."
arch=('any')
url="https://github.com/richvdh/gnupod"
license=('GPL3')
depends=('perl-digest-sha1' 'perl-xml-parser' 'perl-unicode-string' 'perl-mp3-info' 'perl-date-parse' 'perl-text-charwidth')
makedepends=('git')
source=("git+https://github.com/richvdh/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"
    autoconf
    ./configure --prefix=/usr
    make
}

package() {
    install=gnupod.install

    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir/" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
