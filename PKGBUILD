# Maintainer: Zanny <lordzanny@gmail.com
pkgname=quakeinjector-git
_name=quakeinjector
_gitname=QuakeInjector
pkgver=alpha02.r53.d65cfb3
pkgrel=1
pkgdesc="Download, install and play quake singleplayer maps from the quaddicted.com archive"
url="http://www.haukerehfeld.de/projects/quakeinjector/"
arch=(any)
license=(GPL)
depends=(java-environment hicolor-icon-theme)
makedepends=(git apache-ant)
provides=(quakeinjector)
conflicts=(quakeinjector)
replaces=(quakeinjector)
source=("git+https://github.com/hrehfeld/$_gitname.git"
        'quakeinjector.desktop')
md5sums=(SKIP
         'c55fafa5ffa3c9c9cb1188d493e34671')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_gitname"
    ant quakeinjector.jar
}

package() {
    for res in '16' '32' '48' '256'; do
        install -Dm644 "$srcdir/$_gitname/res/Inject2_$res.png" "$pkgdir/usr/share/icons/hicolor/${res}x$res/apps/$_name.png"
    done
    install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 "$srcdir/$_gitname/dist/$_name.jar" "$pkgdir/usr/share/$_name/$_name.jar"
    install -Dm644 "$srcdir/$_gitname/dist/$_name-res.jar" "$pkgdir/usr/share/$_name/$_name-res.jar"
}
