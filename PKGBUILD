# Maintainer: Carlos Solis <csolisr /at/ azkware /dot/ net>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Rogof <rogof /at/ gmx /dot/ com>
# Contributor: Felix Hanley <felix /at/ seconddrawer /dot/ com /dot/ au>
# Contributor: Gesina Schwalbe <gesina.schwalbe /at/ pheerai /dot/ de>

pkgname=multimarkdown
pkgver=6.7.0
pkgrel=1
pkgdesc="A superset of Markdown with various output formats"
arch=("i686" "x86_64")
url="http://fletcherpenney.net/multimarkdown/"
license=("GPL2" "MIT")
depends=("bash")
makedepends=("git" "glib2" "cmake")
optdepends=("texlive-core: LaTeX and PDF output support")
options=(!buildflags)
source=("multimarkdown::git+https://github.com/fletcher/MultiMarkdown-6.git#tag=$pkgver")
sha1sums=("SKIP")

prepare() {
        cd "$srcdir/multimarkdown"
        #git submodule init && git submodule update
        #touch greg/greg.c
        ./link_git_modules
        ./update_git_modules
}

build() {
        cd "$srcdir/multimarkdown"
        make release
        cd "$srcdir/multimarkdown/build"
        make
}

package() {
        cd "$srcdir/multimarkdown"

        # install executable and helper scripts
        install -dm755 "$pkgdir/usr/bin"
        install -Dm755 build/multimarkdown \
                scripts/mmd2tex \
                scripts/mmd2pdf \
                scripts/mmd2opml \
                scripts/mmd2odt \
                scripts/mmd2epub \
                scripts/mmd2all \
                "$pkgdir/usr/bin/"

        #install -dm755 "$pkgdir/usr/share/doc/$pkgname"
        #cp -a submodules/documentation/* "$pkgdir/usr/share/doc/$pkgname"

        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
