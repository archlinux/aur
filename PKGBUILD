# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd-git"
pkgver=1.5.3
pkgrel=2
pkgdesc="A text-based front-end to Remind."
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/wyrd-calendar/wyrd"
license=('GPL2')
provides=('wyrd')
conflicts=('wyrd')
depends=('remind' 'ncurses' 'less' 'ocaml-curses')
makedepends=('ocaml' 'camlp5' 'python' 'autoconf')
# doc: 'hevea' 'texlive-core' 'texlive-latexextra'
source=("${url}/-/jobs/artifacts/${pkgver}/raw/wyrd-${pkgver}.tar.xz?job=release")
sha256sums=('f2469057da3e60907a6697373604c57c3ca1cbed58fac45f186f619b8752d5ff')

build() {
        cd "$srcdir/wyrd-${pkgver}"
        ./prep-devtree.sh
        ./configure --exec-prefix=/usr --prefix=/usr --sysconfdir=/etc
        make wyrd
}

package() {
        cd "$srcdir/wyrd-${pkgver}"
        make DESTDIR="$pkgdir/" install
}
