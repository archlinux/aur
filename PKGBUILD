# Maintainer: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

pkgname='stanza'
pkgver='0.11.7'
pkgrel=2
pkgdesc='The reference compiler for Stanza, a high-level multi-paradigm optionally-typed programming language.'
arch=('x86_64')
groups=()
url='http://lbstanza.org/'
license=('GPL')

depends=(
    'gcc5'
)
makedepends=(
)
optdepends=(
)
provides=(
)
conflicts=(
)

_srcfile='lstanza_0_11_7.zip'
source=(
    "http://lbstanza.org/resources/stanza/$_srcfile"
    'start-stanza.sh'
)
noextract=("$_srcfile")  # Don't extract. Archive is weird. See prepare().
sha256sums=('87f59bf4ad42c76bee7b141fc860c79ee39890acbcf46effec58cb0a17350ffb'
            '0439b9637691d406cec99e74d22c7899e4368954c99746b35a21fbc5f98dbe21')

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

#build() {
#}

package() {
    mkdir "$pkgdir/opt"
    cp -pr "$srcdir/$pkgname" "$pkgdir/opt"

    install -D "$srcdir/start-stanza.sh" "$pkgdir/usr/bin/stanza"

    # For redirecting stanza from gcc 7 to gcc 5.
    mkdir "$pkgdir/opt/stanza/bin"
    ln -s "/usr/bin/gcc-5" "$pkgdir/opt/stanza/bin/cc"
}
