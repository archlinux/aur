# Maintainer: LightQuantum <cy.n01 at outlook dot com>

pkgname=latex-sjtutex-git
pkgver=r343.2f1bda5
pkgrel=1
pkgdesc="Macro Packages and Scripts for SJTU TeX users"
arch=(any)
url="https://github.com/sjtug/SJTUTeX"
license=('LPPL')
depends=('texlive-core')
makedepends=('git' 'unzip' 'zip')
install="${pkgname}.install"
source=('git+https://github.com/sjtug/SJTUTeX' 'patch-0.patch')
md5sums=('SKIP'
         '8bf2684bec9e47f9df06df861aa3068b')

pkgver() {
	cd "$srcdir"/SJTUTeX
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    patch -p0 < patch-0.patch
    cd "$srcdir"/SJTUTeX
    make
    mkdir -p $pkgdir/usr/share/texmf-dist/
    unzip -o -q release/sjtuthesis.tds.zip -d $pkgdir/usr/share/texmf-dist/
}
