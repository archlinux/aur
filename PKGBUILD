# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=vim-jinja-syntax-git
pkgver=master
pkgrel=1
pkgdesc="Vim syntax, file detection, and indentation plugin for Jinja templates"
arch=('any')
url="https://github.com/Glench/Vim-Jinja2-Syntax"
license=('BSD')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('vim-plugins')
source=("$pkgname::git+$url")
sha512sums=('SKIP')


pkgver() {
    cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

    cd "$pkgname"
    install -dm 644 "license" "$pkgdir/usr/share/licenses/${pkgname}/license"

    # install vimfiles

    local vimfiles="$pkgdir/usr/share/vim/vimfiles"
    mkdir -p "$vimfiles"
    cp -dr --no-preserve=ownership \
                        ftdetect \
                        ftplugin \
                        indent \
                        syntax \
                        "$vimfiles"
}
