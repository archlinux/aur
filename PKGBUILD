# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd"
pkgver=1.7.1
pkgrel=4
pkgdesc="A text-based front-end to Remind."
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/wyrd-calendar/wyrd"
license=('GPL2')
provides=('wyrd')
conflicts=('wyrd')
depends=('remind')
makedepends=('ocaml' 'make' 'ocaml-findlib' 'ocaml-curses' 'ocaml-yojson')
# doc: 'ocaml-odoc' 'texlive-core' 'texlive-latexextra'
replaces=('wyrd-git')
source=("${url}/-/jobs/artifacts/${pkgver}/raw/wyrd-${pkgver}.tar.xz?job=release")
sha256sums=('c39d50edc8926ea9f2f091f093dd5e0c2f82638c4b299b39d575a7c3c1cb11c8')

build() {
        cd "$srcdir/wyrd-${pkgver}"
        make PREFIX=/usr wyrd
}

package() {
        cd "$srcdir/wyrd-${pkgver}"
        make DESTDIR="$pkgdir/" PREFIX=/usr install
        install -d "$pkgdir"/usr/share/doc/"$pkgname"/
        install -Dm644 wyrdrc "$pkgdir"/usr/share/doc/"$pkgname"/wyrdrc.example
}
