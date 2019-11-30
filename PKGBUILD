# Maintainer: Hans Ole Hatzel <hhatzel@gmail.com>
pkgname=otf-fira-mono-italic-git
pkgver=7205478c
pkgrel=1
pkgdesc="Italic and bold-italic version of Fira Mono"
arch=("any")
url="https://github.com/Avi-D-coder/fira-mono-italic"
license=("custom:OFL")
depends=("fontconfig" "xorg-font-utils")
makedepends=("git")
install=otf.install
source=("$pkgname::git+https://github.com/Avi-D-coder/fira-mono-italic.git" 'otf.install')
md5sums=("SKIP"
         "ae560f6f3cc2687fbfaec8073567ee2f")

_gitname=fira-mono-italic

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags --always | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

package() {
    cd "$srcdir/$_gitname"

    local weights=(
        'Regular Italic'
        'Bold Italic'
    )
    local font="Fira Mono"

    for weight in "${weights[@]}"; do
        echo $weight
        local name="${font}-${weight}.otf"
        ls "distr/otf/"
        install -Dm644 "distr/otf/${name}" "$pkgdir/usr/share/fonts/OTF/${name}"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:sw=4:ts=4:et:
