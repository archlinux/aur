# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=salsapipe
pkgname=${_pkgname}-git
pkgver=20140730.r25.51c5c6b
pkgrel=1
pkgdesc="Encrypted network tunneling using salsa20 from libnettle and GPG from libgpgme"
url="https://github.com/0xcaca0/${_pkgname}"
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
groups=('archassault' 'archassault-networking')
depends=('gpgme' 'nettle')
makedepends=('git')

source=("git://github.com/0xcaca0/${_pkgname}.git#branch=master"
        "LICENSE")
sha512sums=('SKIP' '98cb62428d5dd50917a5ce69ad4e7508b5447b1aba83080e2d870f3b410db3747d0ff31b142b9d1c3b8dab10fba028fb78962b23d02cd47352bc2f2cd7dd8620')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    make
}

package() {
    install -Dm755 ${_pkgname}/salsamsg "${pkgdir}/usr/bin/salsamsg"
    install -Dm644 ${_pkgname}/salsamsg.1 "${pkgdir}/usr/share/man/man1/salsamsg.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
