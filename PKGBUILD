# Maintainer: Giampaolo Mancini <mancho@trmpln.com>
pkgname=mqtt-spy
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="mqtt-spy is an open source desktop & command line utility intended to help you with monitoring activity on MQTT topics"
arch=("any")
url="https://github.com/eclipse/paho.mqtt-spy"
license=('EPL-v10')
groups=()
depends=('java-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/eclipse/paho.$pkgname/releases/download/$pkgver/$pkgname-$pkgver.jar"
        $pkgname.sh
        $pkgname.desktop)
noextract=("mqtt-spy-1.0.0.jar")
sha256sums=("4333402f4c2e5212361bc83e0801fccda1cc40acd080c64b656f089122cbc2d0"
            "045ddc38a3e96f04592f3dfc57d36029d23aea8faa2db0dfe3119a4d3b38d94c"
            "fa49e3b18c61eb0af9c562aa94208f3ecf9c1869e81b81cb84fef1b8450c1aa1")

prepare() {
    cd "${srcdir}"
    bsdtar -xf $pkgname-$pkgver.jar ui/images/$pkgname-logo.png 
}

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/share/$pkgname/$pkgname.sh
    install -Dm644 $pkgname-$pkgver.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar
    install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
    install -Dm644 ui/images/$pkgname-logo.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
    install -d "${pkgdir}"/usr/bin/
    ln -s /usr/share/$pkgname/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname 
}
