# Creator: Frank LENORMAND <lenormf@gmail.com>

pkgname=qwerty-lafayette
pkgver=0.6.1
pkgrel=2
pkgdesc="QWERTY keyboard layout for francophone developers"
arch=("any")
url="https://qwerty-lafayette.org/"
license=('WTFPL')
depends=("xorg-server")
makedepends=("python")
source=(
    "https://qwerty-lafayette.org/releases/lafayette_linux_v${pkgver}.py"
    "0001-only-generate-xorg-symbols.patch"
)
sha256sums=(
    ec89492c1ed4ce2af0b545992bf408aa2cbf29d45ba7af7ea9ef96c3914693bb
    eec99e7ee9621a3d9934c8c4753741c23e187888bd60c16d6a7f08475d725248
)

prepare() {
    patch --follow-symlinks -p1 < 0001-only-generate-xorg-symbols.patch
}

build() {
    mkdir build && cd build

    python ../lafayette_linux_v"${pkgver}".py
}

package() {
    cd build

    install -d "${pkgdir}"/usr/share/X11/xkb/symbols/

    for i in *; do
        install -m644 "${i}" "${pkgdir}"/usr/share/X11/xkb/symbols/
    done
}
