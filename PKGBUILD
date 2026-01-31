# Maintainer: themirrazz <themirrazzxyz@outlook.com>
pkgname=ajclassic-grapefruit
pkgdesc="Lightweight launcher and runtime for AJ Classic"
pkgver=1.0.0
url="https://github.com/themirrazz/grapefruit"
pkgrel=1
arch=("x86_64")
provides=("ajclassic-bin")
conflicts=("ajclassic-bin"
           "ajceverywhere-bin")
license=('custom')
options=('!strip' '!debug')
source=("index.js::https://raw.githubusercontent.com/themirrazz/grapefruit/refs/heads/main/index.js"
        "package.json::https://raw.githubusercontent.com/themirrazz/grapefruit/refs/heads/main/package.json"
        "launcher.sh::https://raw.githubusercontent.com/themirrazz/grapefruit/refs/heads/main/aur/launcher.sh"
        "ajclassic-grapefruit.desktop::https://raw.githubusercontent.com/themirrazz/ajc-everywhere/refs/heads/main/util/DesktopEntry.desktop"
        "libdir.js::https://raw.githubusercontent.com/themirrazz/grapefruit/refs/heads/main/aur/libdir-final-fix.js"
        "ajclassic.7z::https://classic-download.animaljam.com/win/aj-classic-1.5.7-ia32.nsis.7z"
    )
sha256sums=("c815462af72c04b420e923cc0b834d87826927d05b52e00c09e857c45509cc21"
            "4654808108b59a68a8855e1d7d50ae000904e62e08d56989517b347544a0a8f6"
            "779f620cdbf9b5fb916c1e84bb54b2d74c01b537885e712bc99bf3f9cffbd09f"
            "8b3457765e78af04b97a3c68a76ee53eac65132d0b681116335c3cdf51c30665"
            "9e04be366a7188b72f5eb16b1bc9369e29a23bb2a673f42996c418a1e9f56a6c"
            "c8eb7129c449cec60e8b17252c228cc96eebbf7bc307601061ea72a17248e286")

prepare() {
    mkdir ajclassic-grapefruit
    mv index.js ajclassic-grapefruit/index.js
    mv package.json ajclassic-grapefruit/package.json
    mv libdir.js ajclassic-grapefruit/libdir.js
    7z e ajclassic.7z resources/app.asar
    mv app.asar ajclassic-grapefruit/game.asar
    echo "1.5.7" > ajclassic-grapefruit/game-version.lock
    mkdir bins
    cp launcher.sh bins/aj-classic
    cp launcher.sh bins/ajclassic-grapefruit
}

package() {
    cd bins
    install -Dm755 -t "$pkgdir/usr/bin" aj-classic
    install -Dm755 -t "$pkgdir/usr/bin" ajclassic-grapefruit
    cd ..
    install -Dm755 -t "$pkgdir/usr/share/applications" ajclassic-grapefruit.desktop
    mkdir -p "$pkgdir/usr/lib"
    cp -a ajclassic-grapefruit "$pkgdir/usr/lib"
}
