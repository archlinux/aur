#Maintainer: Shnimlz <shnimlz@proton.me>
#Author Original: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="swengine-revanced"
pkgver="2.2.1a"
pkgrel=1
pkgdesc="Download or upload your wallpapers or use the ones downloaded from wallpaper engine with Sww"
arch=("x86_64")
depends=("vlc" "ffmpeg" "swww-git" "mpvpaper-git" "wlroots-git")
makedepends=("dotnet-sdk" "git")
url="https://github.com/Shnimlz/Swengine"
source=("swengine.desktop")
md5sums=("0cca1884db3254ff31059a181400e09b")

prepare(){
    rm -rf swengine
   git clone https://github.com/Shnimlz/Swengine.git swengine
}
build(){
    cd "$srcdir/swengine/" 
    dotnet publish --self-contained=true --output dist
}
package(){
    cd "$srcdir/swengine/"
    chmod +x ./swengine
    install -d -m 755 "$pkgdir/usr/bin" && cp swengine "$pkgdir/usr/bin"
    install -d -m 755 "$pkgdir/usr/lib/swengine" && cp -r dist/* "$pkgdir/usr/lib/swengine"
    install -Dm644 "$srcdir/swengine/Assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/swengine.png"
    install -Dm644 "$srcdir/swengine.desktop" "$pkgdir/usr/share/applications/swengine.desktop"    
}