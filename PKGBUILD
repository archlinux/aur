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
        'quakeinjector.desktop')
md5sums=(SKIP
         'c55fafa5ffa3c9c9cb1188d493e34671')

build() {
    cd "$srcdir/$_gitname"
    gradle assemble
}

package() {
    for res in '16' '32' '48' '256'; do
        install -Dm644 "$srcdir/$_gitname/build/resources/main/Inject2_$res.png" "$pkgdir/usr/share/icons/hicolor/${res}x$res/apps/$_name.png"
    done
    install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 "$srcdir/$_gitname/build/libs/$_gitname-$pkgver.jar" "$pkgdir/usr/share/$_name/$_name.jar"
}
