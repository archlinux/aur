# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>

pkgname=ps3mca_tool-git
pkgver=r3.26acc6b
pkgrel=1
pkgdesc='Command line utility to manage Playstation 2 Memory Cards using the PS3 Memory Card Adapter'
url='https://github.com/Dewey-Wilkerson/ps3mca_tool_linux/'
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=('libusb' 'libusb-compat')
makedepends=('cmake' 'git')
install="$pkgname.install"
source=(
    "git+https://github.com/Dewey-Wilkerson/ps3mca_tool_linux#branch=linux"
    "60-ps3mca.rules"
)
sha256sums=(
    'SKIP'
    'ba91b198d3174d132aebf3712eaf3e53d0375c93cf25483ccb4d03029576d252'
)

pkgver() {
    cd $srcdir/ps3mca_tool_linux
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/ps3mca_tool_linux && ./build.sh
}

package() {

    install -Dm755 $srcdir/ps3mca_tool_linux/build/ps3mca $pkgdir/usr/bin/ps3mca
    install -Dm644 $srcdir/60-ps3mca.rules $pkgdir/usr/lib/udev/rules.d/60-ps3mca.rules
}
