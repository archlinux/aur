# Creator: Frank LENORMAND <lenormf@gmail.com>

pkgname=qwerty-lafayette
pkgver=0.8.1
pkgrel=1
pkgdesc="QWERTY keyboard layout for francophone developers"
arch=("any")
url="https://qwerty-lafayette.org/"
license=("WTFPL")
depends=("xorg-server")
makedepends=("python")
source=(
    "https://qwerty-lafayette.org/releases/lafayette_linux_v${pkgver}.py"
    "0001-feat-Remove-unbreakable-spaces-from-the-layouts.patch"
    "0002-feat-Generate-symbol-files-locally-and-exit.patch"
)
sha256sums=(
    cb39b8ccc66be995a747d7fc8443ca7a131a6890380854504210f5a6274d311f
    6a638f02808a6eb40510e245ff30bb090d8a5f0af348a8de5dc5cb1c5084d3dd
    7457a1faa275ce66f33626bcfe0d00f2e1cc0ab0e7153b2348419e9e582e620a
)

prepare() {
    patch --follow-symlinks -p1 < 0001-feat-Remove-unbreakable-spaces-from-the-layouts.patch
    patch --follow-symlinks -p1 < 0002-feat-Generate-symbol-files-locally-and-exit.patch
}

build() {
    mkdir -p build && cd build

    python ../lafayette_linux_v"${pkgver}".py
}

package() {
    cd build

    install -d  "${pkgdir}"/usr/share/X11/xkb/symbols/
    install -m644 * "${pkgdir}"/usr/share/X11/xkb/symbols/
}
