# Maintainer: Marc Steiner (Marc3842h) <info@marcsteiner.me>
_pkgname=titan-bot
pkgname=titan-bot-git
pkgver=1.6.0
pkgrel=3
pkgdesc="A free, advanced CS:GO report and commendation bot built with performance and ease-of-use in mind"
arch=("x86_64")
url="https://github.com/Marc3842h/Titan"
license=("MIT")
depends=("mono>=5.4.0" "gtk3" "libnotify" "libappindicator-gtk3")
makedepends=("git" "msbuild")
provides=("titan-bot")
install="Titan.install"
source=("git://github.com/Marc3842h/Titan.git" "titan" "Titan.desktop")
sha256sums=("SKIP" 
            "0db0d38173ad4631a75d8cffe725e99bf05c4c5724cf3acfb413684b71fa88db" 
            "0340ee6a5ec048c5b994bbdbba9337989a1dd415c5765560401f20acad96cf1b")

build() {
    cd Titan
    
    chmod +x build.sh
    ./build.sh
}

package() {
    install -Dm755 titan "$pkgdir"/usr/bin/titan
    install -Dm644 Titan.desktop "$pkgdir"/usr/share/applications/titan.desktop
    
    cd Titan
    install -Dm644 man/Titan.1 "$pkgdir"/usr/share/man/man1/Titan.1
    install -Dm644 README.md "$pkgdir"/usr/share/doc/Titan/README.md
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/Titan/LICENSE.txt
    install -Dm644 Titan/bin/Release/Resources/Logo.png "$pkgdir"/usr/share/pixmaps/Titan.png
    
    for f in $(ls Titan/bin/Release --hide='Resources'); do
        install -Dm755 "Titan/bin/Release/$f" "$pkgdir/opt/Titan/$f"
    done
    
    for f in $(ls Titan/bin/Release/Resources); do
        install -Dm755 "Titan/bin/Release/Resources/$f" "$pkgdir/opt/Titan/Resources/$f"
    done
}
