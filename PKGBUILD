# Maintainer: Salamandar <felix@piedallu.me>

pkgrel=1
pkgver=r57.17a6e47
_pkgname=prezto-contrib
pkgname=prezto-contrib-git
pkgdesc="A set of additional plugins designed to work easily with prezto"
url="https://github.com/belak/prezto-contrib"
arch=('any')
license=('MIT')
depends=('prezto-git')
makedepends=('git' 'coreutils' 'sed')
source=("git+${url}")
options=('!strip')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive

    if [[ -n "$ZPREZTODIR" ]] && [[ "$ZPREZTODIR" != "/usr/lib/prezto" ]]; then
        echo "\$ZPREZTODIR should be equal to /usr/lib/prezto"
        exit 1
    fi

}

package() {
    mkdir -p "$pkgdir/usr/lib/prezto/contrib"

    cp -r "$srcdir/$_pkgname"/* "$pkgdir/usr/lib/prezto/contrib"
}
