#Maintainer: NiNjA <heinep at gmail dot com>
#Maintainer: float <flo.at at gmx dot de>

pkgname=s25rttr
pkgver=20170924
build=1903c0fc683fafb79a287992fbc8c6aff0bbafeb
pkgrel=1
pkgdesc="Return to the Roots. A free clone of The Settlers II from 1996 (Original copy required)"
arch=('i686' 'x86_64')
url="http://www.siedler25.org/"
license=('GPL3')
depends=('sdl>=1.2.0' 'sdl_mixer>=1.2.0')
install="s25rttr.install"
source=($pkgname $pkgname.desktop $pkgname.xpm $pkgname.install)
md5sums=('23235e636d60c380aa1631b44fabbb6b'
         '8c486f63efb1c9bec6d50306270f1b4c'
         'a7bf0908aac3dbfaed837c19695ca362'
         'f51bc71ef665266ae68ce134892ca612')

if [[ $CARCH == 'i686' ]]; then
    source+=("http://www.siedler25.org/uploads/nightly/${pkgname}_${pkgver}-${build}_linux.i386.tar.bz2")
    md5sums+=('6feec68e1f229e856ce6b9d6bbfef006')
elif [[ $CARCH == 'x86_64' ]]; then
    source+=("http://www.siedler25.org/uploads/nightly/${pkgname}_${pkgver}-${build}_linux.x86_64.tar.bz2")
    md5sums+=('b7eec0d3998484c7cceb2c9244ea6f32')
fi

package() {
    install -d -m755 "$pkgdir"/usr/share/
    cp -ra "$srcdir"/"$pkgname"_"$pkgver"/share/* "$pkgdir"/usr/share/
    cp -ra "$srcdir"/"$pkgname"_"$pkgver"/lib/ "$pkgdir"/usr/share/"$pkgname"/
    find "$pkgdir"/usr/ -type d -exec chmod 755 "{}" \;
    find "$pkgdir"/usr/ -type f -exec chmod 644 "{}" \;

    install -Dm644 "$srcdir"/"$pkgname".xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
    install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
    install -Dm755 "$srcdir"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    install -Dm755 "$srcdir"/"$pkgname"_"$pkgver"/bin/s25client "$pkgdir"/usr/bin/s25client

    return 0
}
