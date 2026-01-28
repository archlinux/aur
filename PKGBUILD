# Maintainer: themirrazz <themirrazzxyz@outlook.com>
pkgname=ajceverywhere-bin
pkgdesc="Arch Linux launcher for Animal Jam Classic"
pkgver=0.1.0
url="https://github.com/themirrazz/ajc-everywhere/"
pkgrel=1
arch=("x86_64")
provides=("ajclassic-bin")
conflicts=("ajclassic-bin")
license=('custom')
options=('!strip' '!debug')
source=("AJ.Classic-linux-x64.tar.gz::https://github.com/themirrazz/ajc-everywhere/releases/download/v0.1.0-alpha/AJ.Classic-linux-x64-aur.tar.gz"
        "icon.png::https://raw.githubusercontent.com/themirrazz/ajc-everywhere/refs/heads/main/img/ajclassic-icon.png"
        "launcher.sh::https://raw.githubusercontent.com/themirrazz/ajc-everywhere/refs/heads/main/util/launcher.sh"
        "ajceverywhere.desktop::https://raw.githubusercontent.com/themirrazz/ajc-everywhere/refs/heads/main/util/DesktopEntry.desktop"
    )
sha256sums=("6e5ea8d389ebce29fb92d9fe41da5aebfc30dff7a777d070c5d1716036cb6a04"
            "6a4d3aa87bca0eb80d4de93fad1d31fabf8cb6f7836ad5706831786de29075a0"
            "f565eb4275d7531ac49d5fac19e7f2df95b0306349f3b1789eba466393addc50"
            "8b3457765e78af04b97a3c68a76ee53eac65132d0b681116335c3cdf51c30665")

prepare() {
    cd "$srcdir"
    mkdir ajceverywhere
    tar -xvzf "AJ.Classic-linux-x64.tar.gz" -C "ajceverywhere"
    mv icon.png ajceverywhere.png
    mkdir bins
    cp launcher.sh bins/aj-classic
    cp launcher.sh bins/ajceverywhere
}

package() {
    install -Dm755 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps" ajceverywhere.png
    cd bins
    install -Dm755 -t "$pkgdir/usr/bin" aj-classic
    install -Dm755 -t "$pkgdir/usr/bin" ajceverywhere
    cd ..
    install -Dm755 -t "$pkgdir/usr/share/applications" ajceverywhere.desktop
    mkdir -p "$pkgdir/usr/lib"
    cp -a ajceverywhere "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/lib/ajceverywhere/resources/app/unsafe"
    mkdir -p "$pkgdir/usr/lib/ajceverywhere/resources/app/unsafe/pkg"
    chmod -R 777 "$pkgdir/usr/lib/ajceverywhere/resources/app/unsafe"
}
