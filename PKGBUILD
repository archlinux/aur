# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

pkgname='stanza'
pkgver='0.12.14'
pkgrel=1
pkgdesc='The reference compiler for Stanza, a high-level multi-paradigm optionally-typed programming language.'
arch=('x86_64')
groups=()
url='http://lbstanza.org/'
license=('GPL')

depends=(
)
makedepends=(
)
optdepends=(
)
provides=(
)
conflicts=(
)

_srcfile="lstanza_${pkgver//./_}.zip"
source=(
    "http://lbstanza.org/resources/stanza/$_srcfile"
)
noextract=("$_srcfile")  # Don't extract. Archive is weird. See prepare().
sha256sums=('a32217aa527b1c9b07b09cee342bbb7014d53b2d43e0c71a4920abb3aaf5d649')

install='install'

prepare() {
    # Archive has no parent folder. Make one.
    if [[ -d "$pkgname" ]]; then
        rm -r "$pkgname"
    fi
    mkdir "$pkgname"
    # OK, now extract.
    cd "$pkgname"
    bsdtar xf "$srcdir/$_srcfile"
}

package() {
    mkdir "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    cp -pr "$srcdir/$pkgname" "$pkgdir/opt"
    ln -s "/opt/stanza/stanza" "$pkgdir/usr/bin/stanza"
}
