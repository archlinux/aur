# Maintainer: Zanny <lordzanny@gmail.com
pkgname=quakeinjector
_xtname=QuakeInjector
pkgver=alpha02
pkgrel=1
pkgdesc="Download, install and play quake singleplayer maps from the quaddicted.com archive"
url="http://www.haukerehfeld.de/projects/quakeinjector/"
arch=(any)
license=(GPL)
depends=(java-environment hicolor-icon-theme)
makedepends=(apache-ant)
provides=(quakeinjector)
conflicts=(quakeinjector-git)
replaces=(quakeinjector)
source=("https://github.com/hrehfeld/QuakeInjector/archive/$pkgver.tar.gz"
        'quakeinjector.desktop')
md5sums=('d2e1a0e8a94182256579ea3afad8c3d4'
         'c55fafa5ffa3c9c9cb1188d493e34671')

build() {
    cd "$srcdir/$_xtname-$pkgver"
    ant quakeinjector.jar
}

package() {
    for res in '16' '32' '48' '256'; do
        install -Dm644 "$srcdir/$_xtname-$pkgver/res/Inject2_$res.png" "$pkgdir/usr/share/icons/hicolor/${res}x$res/apps/$pkgname.png"
    done
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$_xtname-$pkgver/dist/$pkgname.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"
    install -Dm644 "$srcdir/$_xtname-$pkgver/dist/$pkgname-res.jar" "$pkgdir/usr/share/$pkgname/$pkgname-res.jar"
}
