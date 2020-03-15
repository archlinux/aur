# Maintainer: Sagiri <i@sagiri.me>

pkgname=osu-git
_pkgname=osu
pkgver=2020.312.0
pkgrel=1
pkgdesc="rhythm is just a *click* away!"
arch=('x86_64')
url="https://osu.ppy.sh/"
license=('MIT')
depends=('ffmpeg')
makedepends=("dotnet-host" "dotnet-runtime" "dotnet-sdk")
conflicts=("osu" "osu-bin")
source=("git://github.com/ppy/osu.git" "osu.desktop")
sha512sums=("SKIP" "264d12f2e52478605a957ee37ba8e299bb54bc2caec72a478c60d267c6e99947e3b66d9c0b4974304d380e1bc3c71e339f25138ff21d9ed7569f7216189d9c73")


build() {
    cd $srcdir/$_pkgname
    dotnet build -c $pkgver $_pkgname.Desktop
}

package() {
    mkdir -p $pkgdir/opt/
    cp -r $srcdir/$_pkgname/$_pkgname.Desktop/bin/$pkgver/netcoreapp3.1/ $pkgdir/opt/$_pkgname/
    
    install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
    
    install -Dm644 $srcdir/$_pkgname/$_pkgname.Desktop/lazer.ico $pkgdir/usr/share/icons/hicolor/32x32/apps/osu.ico
    install -Dm644 $srcdir/$_pkgname/assets/lazer-nuget.png $pkgdir/usr/share/icons/hicolor/128x128/apps/osu.png
    install -Dm644 $srcdir/$_pkgname/assets/lazer.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/osu.png
}
