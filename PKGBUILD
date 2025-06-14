#Maintainer: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="swengine-revanced"
pkgver="0.4"
pkgrel=1
pkgdesc="Download and apply live wallpapers with swww"
arch=("x86_64")
depends=("vlc" "ffmpeg" "swww")
makedepends=("dotnet-sdk" "git")
url="https://github.com/Shnimlz/Swengine"


prepare(){
    rm -rf swengine
    #this is probably not the right way to do this
   git clone https://github.com/Shnimlz/Swengine.git swengine
}
build(){
    cd "$srcdir/swengine/" 
    dotnet publish --self-contained=true  --output dist
}
package(){
    cd "$srcdir/swengine/"
   # chmod +x ./dist/swengine
    chmod +x ./swengine
    #starter script
    install -d -m 755 "$pkgdir/usr/bin" && cp swengine "$pkgdir/usr/bin"
    #binaries
    install -d -m 755 "$pkgdir/usr/lib/swengine" && cp -r dist/* "$pkgdir/usr/lib/swengine"
    #desktop entry
   install -d -m 755 "$pkgdir/usr/share/applications" && cp swengine "$pkgdir/usr/share/applications"
}