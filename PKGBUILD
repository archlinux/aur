# Maintainer: Macitron <macitron3000@gmail.com>

pkgname='polyversal-patcher'
pkgver=2.1.1
# need to fix in next release tarball
_tarname='Polyversal'
_tarver="v${pkgver//./_}"
pkgrel=1
pkgdesc="A utility script for installing Committee of Zero patches for Science Adventure titles"
arch=('any')
url="https://github.com/CommitteeOfZero/polyversal-coz-linux-patcher"
license=('MIT')
depends=('bash' 'curl' 'protontricks')
optdepends=('flatpak: fall back on Flatpak Protontricks in case of system Protontricks failure'
            'zenity: for running in GUI mode')
source=("$_tarname-$_tarver.tar.gz::$url/releases/download/$pkgver/$_tarname-$_tarver.tar.gz"
        "package.patch")
sha512sums=('6387dc4b727ddd28f714199a6eca17a0713172a78a16bfef87b0e30f9cfc5d6d0e95265774d8f7419261d9aa3e737cdbf65988a79ea23528b6a01ea3fbe80d64'
            'fa8cda7b7e66a1c4aca27a3ad5f0f7e2a720cdb5b788011c102328c5bd7bbe61fb80549d7c14bbcbe4e5b8801a43de651971c6dd2173c8f3991548b64501dcc1')

prepare() {
    cd "$srcdir/$_tarname-$_tarver"
    patch -p1 -i "$srcdir/package.patch"
}

package() {

    cd "$srcdir/$_tarname-$_tarver"

    # Binary, desktop entry, license
    install -Dm755 ./polyversal "$pkgdir/usr/bin/polyversal"
    install -Dm644 ./Polyversal.desktop "$pkgdir/usr/share/applications/Polyversal.desktop"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"

    # Documentation
    local _docdir="$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 ./README.md "$_docdir/README.md"
    install -Ddm644 ./docs "$_docdir/docs"
}
