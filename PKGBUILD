pkgname=sakura-editor
pkgver=2.4.2
pkgrel=1
pkgdesc="A free text editor (running on Wine, portable build)"
arch=('x86_64')
url="https://sakura-editor.github.io/"
license=('zlib')

depends=('wine' 'winetricks')
makedepends=('unzip')
optdepends=(
    'ttf-hackgen: recommended Japanese programming font'
    'noto-fonts-cjk: fallback CJK font'
)

source=(
    "sakura.zip::https://github.com/sakura-editor/sakura/releases/download/v2.4.2/sakura-tag-v2.4.2-build4203-a3e63915b-Win32-Release-Exe.zip"
    "sakura-editor.sh"
    "sakura-editor.desktop"
)

noextract=("sakura.zip")

sha256sums=('91f2eae7fe3b2417a47ee678463012e030063cf2694fd6c925fbaebc575dd7e8'
            '665ce82869437625b3832eb8226c6b702c15a5f066c9e1ac11300e576a47ee01'
            'b34a74f6e3667b17a9a89be406bd33f9f58beadf0ab28f21cbbba4a5ca6289a9')

prepare() {
    rm -rf "$srcdir/app"
    mkdir -p "$srcdir/app"
    unzip -o sakura.zip -d "$srcdir/app"
}

package() {
    # copy binary
    install -dm755 "$pkgdir/usr/share/sakura-editor"
    cp -r "$srcdir/app/." "$pkgdir/usr/share/sakura-editor/"

    # wrapper
    install -Dm755 sakura-editor.sh "$pkgdir/usr/bin/sakura-editor"
    install -Dm644 sakura-editor.desktop "$pkgdir/usr/share/applications/sakura-editor.desktop"
}
