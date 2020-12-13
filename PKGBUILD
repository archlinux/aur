# Maintainer:  Quint Guvernator <quint@guvernator.net>
# Contributor: Pipat Saengow <pay2630@gmail.com>

pkgname=hp15c
pkgver=4.2.10
pkgrel=1
pkgdesc="A simulator for the HP-15C programmable scientific RPN calculator"
url="http://hp-15c.homepage.t-online.de/content_web.htm"
arch=('any')
license=('GPL3')
depends=('tcl' 'tk')
source=(
    "$pkgname-$pkgver.zip::https://drive.google.com/uc?export=download&id=1zPKq0wBP3wPMUOw_Fp9yDxOZ7sc4AOg0"
    "hp15c_runner.sh"
    "hp15c.desktop"
)
md5sums=('11ae1e9894488ce38d0709d1e908e0bf'
         '28b63da6ff5404acf6f305bdb35ca1b9'
         'bab776009feb1db971b92649c839ff1f')

prepare() {

    # extract icons
    unzip icons/HP-15C-logo.zip -d $srcdir/icon_extract
}

package() {

    # docs
    mkdir -p "$pkgdir/usr/share/doc/"
    cp -r doc "$pkgdir/usr/share/doc/$pkgname"
    cp "Read Me & Release Notes.html" "$pkgdir/usr/share/doc/$pkgname/README.html"

    # dependencies of script
    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp -r css icons lib msgs images -t "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 HP-15C_Simulator_Font.ttf -t "$pkgdir/usr/share/fonts/"

    # runs script in proper directory
    cp HP-15C.tcl -t "$pkgdir/usr/lib/$pkgname/"
    install -D "$srcdir/hp15c_runner.sh" "$pkgdir/usr/bin/hp15c"

    # install desktop entry
    install -D hp15c.desktop "$pkgdir/usr/share/applications/hp15c.desktop"

    # install icon
    for i in 22 32 48 256 512 ; do
        install -D "icon_extract/HP-15C-logo-${i}x${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/hp15c.png"
    done
}

# vim:set ts=4 sw=4 ft=sh et:
