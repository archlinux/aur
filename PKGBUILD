# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=scroller-git
_gitname=scroller
pkgver=r12.a0d94ab
pkgrel=1
pkgdesc="A utility for truncating text by rolling it like a news ticker"
arch=(any)
url=https://github.com/kbrgl/scroller
license=(custom)
makedepends=(git)
provides=(scroller)
conflicts=(scroller)
source=(git+https://github.com/kbrgl/scroller)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    # No tagged commits. ヽ(´ー｀)ノ
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
