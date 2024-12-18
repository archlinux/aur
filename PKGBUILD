# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=rustcraft
_pkgfont=Rustcraft
_pkgfont_regular=RustCraftRegular
pkgname="$_pkgname-bin"
pkgver=0.8
pkgrel=3
pkgdesc='Minecraft game clone written in Rust'
arch=('x86_64')
url="https://github.com/c2i-junia/$_pkgname"
license=('MIT' 'CC BY-SA-4.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-$CARCH.tar.gz")
sha256sums=('a8d69e2be4f350530457cd87a9e9ab4c51e6d7991db99d0823309b9376e1e9f5')
depends=('gcc-libs' 'vulkan-driver' 'vulkan-icd-loader' 'alsa-lib')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$srcdir"

    install -dm777 "$pkgdir/opt/$_pkgname" # hmm
    cp -a "data" "$pkgdir/opt/$_pkgname/data"

    install -Dm0755 "bin/$_pkgname" -t "$pkgdir/opt/$_pkgname/bin"
    install -Dm0755 "bin/$_pkgname-server" -t "$pkgdir/opt/$_pkgname/bin"


    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    ln -s "/opt/$_pkgname/bin/$_pkgname-server" "$pkgdir/usr/bin/$_pkgname-server"

    install -d "$pkgdir/usr/share/fonts/opentype"
    ln -s "/opt/$_pkgname/data/fonts/$_pkgfont_regular-Bmg3.otf" "$pkgdir/usr/share/fonts/opentype/$_pkgfont_regular.otf"
    ln -s "/opt/$_pkgname/data/fonts/${_pkgfont}Bold-nMK1.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}Bold.otf"
    ln -s "/opt/$_pkgname/data/fonts/${_pkgfont}BoldItalic-1y1e.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}BoldItalic.otf"
    ln -s "/opt/$_pkgname/data/fonts/${_pkgfont}Italic-R8Mo.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}Italic.otf"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
