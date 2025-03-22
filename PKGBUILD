# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd"
pkgver=1.7.2
pkgrel=1
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
source=("${url}/-/jobs/artifacts/${pkgver}/raw/public/wyrd-${pkgver}.tar.xz?job=pages")
sha256sums=('a6567f6ac028a33b4390ef4c7ea7be2a8b1d9a3efe8aabe6560debd1df4404d2')
options=('!strip' '!debug')

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
