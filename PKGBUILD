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
         '072b07f42020e5d1787b5f0a2a6d091248c475cafbd2da8308f4955516a3df5c'
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
