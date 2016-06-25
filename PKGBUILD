# Maintainer: shellkr <revoltism+AUR$gmail.com>

pkgname=textsuggest-git
_gitname=${pkgname%-git*}
pkgver=r23.1519640
pkgrel=2
pkgdesc='Simple Linux utility to autocomplete words using rofi'
arch=('any')
url="https://github.com/bharadwaj-raju/TextSuggest"
license=('GPL3')
depends=('python' 'rofi' 'xorg-setxkbmap' 'xdotool' 'xclip')
makedepends=('git')
provides=("$_gitname")
source=("$_gitname::git+https://github.com/bharadwaj-raju/TextSuggest.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/$_gitname"
		patch -uN "TextSuggest.py" "$startdir/textsuggest.patch"
}

package() {
    cd "$srcdir/$_gitname"
    install -d "$pkgdir/usr/lib/python3.5/site-packages/textsuggest/EnglishOpenWordList/"
    install -d "$pkgdir/usr/bin/"
    install -D -m755 TextSuggest.py "$pkgdir/usr/lib/python3.5/site-packages/textsuggest/"
    install -D -m644 EnglishOpenWordList/* "$pkgdir/usr/lib/python3.5/site-packages/textsuggest/EnglishOpenWordList/"
    install -D -m644 Extra_Words.txt "$pkgdir/usr/lib/python3.5/site-packages/textsuggest/"
    install -D -m644 languages.py "$pkgdir/usr/lib/python3.5/site-packages/textsuggest/"
    install -D -m644 fonts.py "$pkgdir/usr/lib/python3.5/site-packages/textsuggest/"
    install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    ln -fs "/usr/lib/python3.5/site-packages/textsuggest/TextSuggest.py" "$pkgdir/usr/bin/textsuggest"
}

