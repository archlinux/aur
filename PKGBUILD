#Maintainer: Matthias Mailänder <matthias at mailaender dot name>
#Contributor NiNjA <heinep at gmail dot com>
#Contributor float <flo.at at gmx dot de>

pkgname=s25rttr
pkgver=0.9.5
build=397f2b2315e997504d4958bfbdea0af815ce559a
pkgrel=1
pkgdesc="Return to the Roots is an unofficial extension of (Die Siedler II) ® by BlueByte Software GmbH. Put the files from the original game in the folder (/usr/share/s25rttr/S2/)"
arch=('i686' 'x86_64')
url="https://www.siedler25.org/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer')
install="s25rttr.install"
source=($pkgname $pkgname.desktop $pkgname.xpm $pkgname.install)
md5sums=('23235e636d60c380aa1631b44fabbb6b'
         '8c486f63efb1c9bec6d50306270f1b4c'
         'a7bf0908aac3dbfaed837c19695ca362'
         'f51bc71ef665266ae68ce134892ca612')

if [[ $CARCH == 'x86_64' ]]; then
    source+=("http://www.siedler25.org/uploads/stable/${pkgname}_${pkgver}-${build}-linux.x86_64.tar.bz2")
    md5sums+=('108b58ee7a25e08637f3acbead239ded')
fi

package() {
    install -d -m755 "$pkgdir"/usr/share/
    cp -ra "$srcdir"/"$pkgname"_"$pkgver"/share/* "$pkgdir"/usr/share/
    cp -ra "$srcdir"/"$pkgname"_"$pkgver"/lib/ "$pkgdir"/usr/lib/
    find "$pkgdir"/usr/ -type d -exec chmod 755 "{}" \;
    find "$pkgdir"/usr/ -type f -exec chmod 644 "{}" \;

    install -Dm644 "$srcdir"/"$pkgname".xpm "$pkgdir"/usr/share/pixmaps/"$pkgname".xpm
    install -Dm644 "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
    install -Dm755 "$srcdir"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    install -Dm755 "$srcdir"/"$pkgname"_"$pkgver"/bin/s25client "$pkgdir"/usr/bin/s25client
}
