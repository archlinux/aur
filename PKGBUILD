# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=words-ru
pkgver=20130218
pkgrel=1
pkgdesc="A wordlist of russian words for /usr/share/dict/."
arch=('any')
url="http://www.winedt.org/Dict/"
license=('custom:copyright')
source=("http://www.winedt.org/dict/ru.zip"
        "copyright::http://www.winedt.org/dict/ru.html")
md5sums=('b6bb9cfcf20a923c1e6e4bc280201764'
        '8a9f68136e7efb386b5f711cf56ac785')

build() {
    cd "$srcdir"
    for dict in *.dic; do
      iconv -f 'UTF-16LE' -t 'UTF-8' "$dict" > "$dict.utf"
    done
    cat *.utf > "$srcdir/russian"
}

package() {
    cd "$srcdir"
    install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/Copyright"
    install -Dm644 russian "$pkgdir/usr/share/dict/russian"
}
