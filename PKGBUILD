# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

pkgname='stanza'
pkgver='0.12.8'
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
sha256sums=('09d10c3a7271f101df1cbaf0f4c09ca5a31f1e9fe43fcc141174f7463c4f4bdd')

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
