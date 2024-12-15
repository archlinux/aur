# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=rustcraft
_pkgfont=Rustcraft
_pkgfont_regular=RustCraftRegular
pkgname="$_pkgname-bin"
pkgver=0.8
pkgrel=2
pkgdesc='Minecraft game clone written in Rust'
arch=('x86_64')
url="https://github.com/c2i-junia/$_pkgname"
license=('MIT' 'CC BY-SA 4.0')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('a8d69e2be4f350530457cd87a9e9ab4c51e6d7991db99d0823309b9376e1e9f5')
depends=('glibc' 'vulkan-driver' 'vulkan-icd-loader')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$srcdir"

    install -Dm0755 "bin/$_pkgname" -t "$pkgdir/opt/$_pkgname/bin"
    install -Dm0755 "bin/$_pkgname-server" -t "$pkgdir/opt/$_pkgname/bin"

    cp -R "data" "$pkgdir/opt/$_pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/bin/$_pkgname-server" "$pkgdir/usr/bin/$_pkgname-server"

    mkdir -p "$pkgdir/usr/share/fonts/opentype"
    ln -s "$pkgdir/opt/$_pkgname/data/fonts/$_pkgfont_regular-Bmg3.otf" "$pkgdir/usr/share/fonts/opentype/$_pkgfont_regular.otf"
    ln -s "$pkgdir/opt/$_pkgname/data/fonts/${_pkgfont}Bold-nMK1.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}Bold.otf"
    ln -s "$pkgdir/opt/$_pkgname/data/fonts/${_pkgfont}BoldItalic-1y1e.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}BoldItalic.otf"
    ln -s "$pkgdir/opt/$_pkgname/data/fonts/${_pkgfont}Italic-R8Mo.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}Italic.otf"

    install -Dm0755 "$startdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
