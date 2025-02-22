# Maintainer: Dimitri Kaparis <dimitri@kaparis.name>

pkgname=fuz-git
_pkgname=${pkgname%-git}
pkgver=r216.cbc8164
pkgrel=1
pkgdesc="Blazingly fast text, file and folder fuzzy search tool"
arch=(any)
url="https://github.com/Magnushhoie/fuz"
license=('MIT')
depends=('fzf' 'ripgrep' 'bat')
makedepends=('git')
install="$_pkgname.install"
source=("git+$url"
    "fuz-aliases")
sha256sums=('SKIP'
    '5856915b7f6303cef894ada246e365bd0e78edbcf3b9bc3446ecc44f3b4cd8b3')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D fuz-aliases $pkgdir/etc/bash/bashrc.d/fuz
    cd "$srcdir/$_pkgname"
    install -Dm 755 $_pkgname fuz_scripts.sh -t $pkgdir/usr/bin/
    install -D README.md $pkgdir/usr/share/doc/$_pkgname/README.md
    install -D LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
