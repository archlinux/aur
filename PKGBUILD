# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=k-git
pkgver=r189.e2bfbaf
pkgrel=2
pkgdesc="a zsh script / plugin to make directory listings more readable, adding a bit of color and some git status information on files and directories."
arch=('any')
url="https://github.com/supercrabtree/k"
license=('unknown')
depends=('zsh')
makedepends=('git')
provides=("$pkgname")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/supercrabtree/k.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# cd "$srcdir/${pkgname}"
    cd "$srcdir/${pkgname%-git}"
	install -Dm755 * -t "$pkgdir/usr/bin/k"
    if grep -q "source /usr/bin/k/k.sh" $HOME/.zshrc
    then
        echo "config in .zshrc already satisfied"
    else
        echo "source /usr/bin/k/k.sh" >> $HOME/.zshrc
    fi
}