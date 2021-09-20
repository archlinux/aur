#Maintainer: NiNjA <heinep at gmail dot com>
#Maintainer: float <flo.at at gmx dot de>

pkgname=s25rttr
pkgver=20210918
pkgsubver=0.9.1
build=7273dd8c3fa98f3892af28d415aca77a5d58fdd4
pkgrel=1
pkgdesc="Return to the Roots. A free clone of The Settlers II from 1996 (Original copy required) Put your S2-Installation in /usr/share/s25rttr/S2/"
arch=('i686' 'x86_64')
url="http://www.siedler25.org/"
license=('GPL3')
depends=('sdl>=1.2.0' 'sdl_mixer>=1.2.0')
install="s25rttr.install"
source=($pkgname $pkgname.desktop $pkgname.xpm $pkgname.install)
md5sums=('23235e636d60c380aa1631b44fabbb6b'
         '8c486f63efb1c9bec6d50306270f1b4c'
         'a7bf0908aac3dbfaed837c19695ca362'
         'f51bc71ef665266ae68ce134892ca612'
         '956a47cde4334a8cdaf7362df6777009')

if [[ $CARCH == 'i686' ]]; then
    source+=("http://www.siedler25.org/uploads/stable/${pkgname}_${pkgsubver}-${build}-linux.i386.tar.bz2")
    md5sums+=('6feec68e1f229e856ce6b9d6bbfef006')
elif [[ $CARCH == 'x86_64' ]]; then
    source+=("http://www.siedler25.org/uploads/stable/${pkgname}_${pkgsubver}-${build}-linux.x86_64.tar.bz2")
    md5sums+=('956a47cde4334a8cdaf7362df6777009')
fi

package() {
    install -d -m755 "$pkgdir"/usr/share/
    cp -ra "$srcdir"/"$pkgname"_"$pkgsubver"/share/* "$pkgdir"/usr/share/
    cp -ra "$srcdir"/"$pkgname"_"$pkgsubver"/lib/ "$pkgdir"/usr/lib/
    find "$pkgdir"/usr/ -type d -exec chmod 755 "{}" \;
    find "$pkgdir"/usr/ -type f -exec chmod 644 "{}" \;

    install -Dm644 "$srcdir"/"$pkgname".xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
    install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
    install -Dm755 "$srcdir"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    install -Dm755 "$srcdir"/"$pkgname"_"$pkgsubver"/bin/s25client "$pkgdir"/usr/bin/s25client

    return 0
}

