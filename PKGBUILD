# Maintainer: Yamada Hayao <hayao@fascode.net>
pkgname=archnews
pkgver='20220720'
pkgrel='1'
pkgdesc='Show the latest news from Arch Linux official page'
arch=('any')
url='https://gist.github.com/Hayao0819/897be45dfedb0aa4fcc2735a0831966f'
license=('WTFPL')
depends=('zenity')
source=(
    "archnews.sh::https://gist.githubusercontent.com/Hayao0819/897be45dfedb0aa4fcc2735a0831966f/raw/ArchNews.sh"
    "show-archnews.desktop::https://gist.githubusercontent.com/Hayao0819/897be45dfedb0aa4fcc2735a0831966f/raw/show-archnews.desktop"
    "FasBashLib::git+https://github.com/Hayao0819/FasBashLib.git#commit=3198a759281504ccb2af4df76fca192be9a81e17"
)
sha512sums=('SKIP' 'SKIP' 'SKIP')


build(){
    cd "$srcdir/FasBashLib"
    git submodule update --init --recursive
    ./tools.sh build single -out "$srcdir/fasbashlib.sh" URL BetterShell Parsrs Array ParseArg
}

package() {
    # Install files
    install -Dm 755 "$srcdir/archnews.sh" "$pkgdir/usr/bin/archnews"
    install -Dm 644 "$srcdir/show-archnews.desktop" "$pkgdir/usr/share/applications/show-archnews.desktop"
    install -Dm 755 "${srcdir}/fasbashlib.sh" "$pkgdir/usr/lib/archnews.sh"
}
