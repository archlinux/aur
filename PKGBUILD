# Maintainer: Zanny <lordzanny@gmail.com
pkgname=quakeinjector
_name=quakeinjector
_gitname=QuakeInjector
pkgver=alpha05
pkgrel=1
pkgdesc="Download, install and play quake singleplayer maps from the quaddicted.com archive"
url="http://www.haukerehfeld.de/projects/quakeinjector/"
arch=(any)
license=(GPL)
depends=(java-environment hicolor-icon-theme)
makedepends=(git gradle)
provides=(quakeinjector)
conflicts=(quakeinjector)
replaces=(quakeinjector)
source=("git+https://github.com/hrehfeld/$_gitname.git#tag=$pkgver"
        'quakeinjector.desktop'
        'quakeinjector')
sha256sums=(SKIP
         'f9bb3bd6b304caa7768250f2490564ea8b67dc0c6257ce5a293c868bef35f903'
         '516be20258f7729c31d176988077bcaac7ee7e5d09cbc0fe6e268d7987c84ee9')

build() {
    cd "$srcdir/$_gitname"
    gradle assemble
}

package() {
    for res in '16' '32' '48' '256'; do
        install -Dm644 "$srcdir/$_gitname/build/resources/main/Inject2_$res.png" "$pkgdir/usr/share/icons/hicolor/${res}x$res/apps/$_name.png"
    done
    install -Dm755 "$srcdir/$_name" "$pkgdir/usr/bin/$_name"
    install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 "$srcdir/$_gitname/build/libs/$_gitname-$pkgver.jar" "$pkgdir/usr/share/$_name/$_name.jar"
}
