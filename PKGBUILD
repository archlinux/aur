# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd"
pkgver=1.7.1
pkgrel=3
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
sha256sums=('9ff3df41ea18d59f070aa656874bf7a98e875f1db47d375de13a482429bd4f1a')

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
