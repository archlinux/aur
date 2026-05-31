# Maintainer: nulldayo <nulldayo at inatuz dot im>
pkgname=sakura-editor
pkgver=2.4.2
pkgrel=2
pkgdesc="A free text editor running on Wine, portable build"
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
    "sakura.ico"
)

noextract=("sakura.zip")

sha256sums=('91f2eae7fe3b2417a47ee678463012e030063cf2694fd6c925fbaebc575dd7e8'
            '1cf78fe467e8366cdd292466540623914e1bacbd9474cafba7d18af5d56760fb'
            '33c6dc7dbcb2cc656754e35a3547da9982f1a0f316378b7eb287b1234887dd9f'
            'dfe65bc2387b3d1552d7dbb624c44262e076e269899a315aef4015915ed05247')

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

    # icon
    install -Dm644 sakura.ico "$pkgdir/usr/share/pixmaps/sakura.ico"
}
