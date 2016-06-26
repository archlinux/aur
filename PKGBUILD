# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=textsuggest-git
_gitname=${pkgname%-git*}
pkgver=r35.ccbcbc9
pkgrel=1
pkgdesc='Simple Linux utility to autocomplete words using rofi'
arch=('any')
url="https://github.com/bharadwaj-raju/TextSuggest"
license=('GPL3')
depends=('python' 'rofi' 'xdotool' 'xclip')
makedepends=('git')
provides=("$_gitname")
source=("$_gitname::git+https://github.com/bharadwaj-raju/TextSuggest.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
    install -d "$pkgdir/usr/share/"
    cp -rf textsuggest "$pkgdir/usr/share/"
    install -D -m755 TextSuggest.py "$pkgdir/usr/bin/textsuggest"
    install -D -m644 languages.py -t "$pkgdir/usr/lib/python3.5/site-packages/"
    install -D -m644 fonts.py -t "$pkgdir/usr/lib/python3.5/site-packages/"
    install -D -m644 textsuggest.1 -t "$pkgdir/usr/share/man/man1/"
    install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

