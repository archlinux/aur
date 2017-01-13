# Maintainer: afontenot <adam.m.fontenot@gmail.com>

pkgname="logic2010"
pkgver="20161225"
pkgrel="1"
pkgdesc="Educational symbolic logic software provided for free by UCLA"
arch=('any')
url="https://logiclx.humnet.ucla.edu"
license=('custom')
depends=('bash' 'java-environment')
makedepends=('unzip')
source=("$url/auto_remote/desktop/$pkgver/Logic2010_mac_$pkgver.zip"
        "$url/images/Logic2010_64.png" #icon
        "LICENSE"
        "logic2010.sh"
        "logic2010.desktop")
noextract=("Logic2010_mac_$pkgver.zip")
sha256sums=('708aeb2233d70be2cc7db2870895dec613b5f08b4a14ae343194bd89701ec286'
            'cf207dd45240336b77ed92192658b0e66e8873ce5a2e43a4faab6664da4305fb'
            'a8e232f0e92a6443765a1649a7e1400efc06f7d81fe1420a85ba781a97dbbdc7'
            'c96d47ca05518bd843318629cb3cd584c380129c2cdefc7ae2c63b3165ddcc22'
            '622c3912d99b188843fdc6f303f8dd6a7475f7c7b291ae4ab6f26b4fd4a76993')

prepare() {
    unzip "Logic2010_mac_$pkgver.zip"
}

package() {
    cd "$srcdir"

    install -Dm 644 "Contents/Java/logic.jar" "$pkgdir/opt/$pkgname/logic.jar"
    cp -r --no-preserve=all Contents/Resources/* "$pkgdir/opt/$pkgname/"

    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -Dm 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
   
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm 644 "Logic2010_64.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
