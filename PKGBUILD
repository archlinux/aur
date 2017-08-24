# Maintainer: Petko Bordjukov <bordjukov@gmail.com>

_pkgname=hyphen-bg
pkgname="$_pkgname"-git
pkgver=r2331.93db4f5
pkgrel=1
pkgdesc="Bulgarian hyphenation rules"
arch=(any)
url="https://docs.libreoffice.org/lingucomponent.html"
license=('GPL2')
optdepends=('hyphen: offers hyphenation library functions')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(dictionaries::git+https://github.com/LibreOffice/dictionaries.git)
sha256sums=('SKIP')

build() {
    /bin/true
}

pkgver() {
  cd "$srcdir"/dictionaries
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir"

    # dictionary
    install -dm755 "${pkgdir}"/usr/share/hyphen
    cp -p dictionaries/bg_BG/hyph_bg_BG.dic "${pkgdir}"/usr/share/hyphen/

    # symlink
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    ln -s /usr/share/hyphen/hyph_bg_BG.dic "${pkgdir}"/usr/share/myspell/dicts/

    # license
    install -D -m644 "${srcdir}"/dictionaries/bg_BG/COPYING "${pkgdir}"/usr/share/licenses/"$pkgname"/LICENSE

    # docs
    install -dm755 "$pkgdir"/usr/share/doc/"$pkgname"
    cp -p dictionaries/bg_BG/README_hyph_bg_BG.txt "$pkgdir"/usr/share/doc/"$pkgname"
}
