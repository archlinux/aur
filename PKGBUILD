# Maintainer: Célestin Matte aur [at] ploudseeker dot com
# Contributor: tealeaf joss-arch@pseudonymity.net
# Contributor: ormris ormris@ormris.com

pkgname="wyrd"
pkgver=1.6.1
pkgrel=1
pkgdesc="A text-based front-end to Remind."
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/wyrd-calendar/wyrd"
license=('GPL2')
provides=('wyrd')
conflicts=('wyrd')
depends=('remind' 'ocaml-curses')
makedepends=('ocaml' 'camlp5' 'autoconf')
# doc: 'hevea' 'texlive-core' 'texlive-latexextra'
replaces=('wyrd-git')
source=("${url}/-/jobs/artifacts/${pkgver}/raw/wyrd-${pkgver}.tar.xz?job=release")
sha256sums=('f4b05e7b0959ffaf41e685b74ed97d2d3d18bdd55bbf4449fa28946af24fa01d')
backup=('etc/wyrdrc')

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
