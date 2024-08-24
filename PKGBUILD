#Maintainer: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="swengine"
pkgver="0.1"
pkgrel=1
pkgdesc="Download and apply live wallpapers with swww"
arch=("x86_64")
depends=("vlc" "ffmpeg" "swww-git")
makedepends=("dotnet-sdk" "git")
url="https://www.github.com/eugenenoble2005/swengine"


prepare(){
    rm -rf swengine
    #this is probably not the right way to do this
    git clone https://www.github.com/eugenenoble2005/swengine.git
}
build(){
    cd "$srcdir/swengine/swengine.desktop" 
    dotnet publish --self-contained=true  --output dist
}
package(){
    cd "$srcdir/swengine/swengine.desktop"
    chmod +x ./dist/swengine.desktop
    chmod +x ./swengine
    #starter script
    install -d -m 755 "$pkgdir/usr/bin" && cp swengine "$pkgdir/usr/bin"
    #binaries
    install -d -m 755 "$pkgdir/usr/lib/swengine" && cp -r dist/* "$pkgdir/usr/lib/swengine"
    #desktop entry
   install -d -m 755 "$pkgdir/usr/share/applications" && cp swengine.desktop "$pkgdir/usr/share/applications"
}