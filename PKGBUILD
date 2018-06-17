# Maintainer: Giampaolo Mancini <mancho@trmpln.com>
pkgname=mqtt-spy
pkgver=1.0.1
_pkgbeta1=-beta18
_pkgbeta2=-beta
_pkgpre=-b18-jar-with-dependencies
pkgrel=1
epoch=
pkgdesc="An open source desktop & command line utility intended to help you with monitoring activity on MQTT topics"
arch=("any")
url="https://github.com/eclipse/paho.mqtt-spy"
license=('EPL-v10')
groups=()
depends=('java-runtime' 'java-openjfx')
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
source=("https://github.com/eclipse/paho.$pkgname/releases/download/$pkgver$_pkgbeta1/$pkgname-$pkgver$_pkgbeta2$_pkgpre.jar"
        $pkgname.sh
        $pkgname.desktop)
sha256sums=("c876f974be43af137b3372c04b43f6aef50160bff905da160189c7cca6c4912a"
            "045ddc38a3e96f04592f3dfc57d36029d23aea8faa2db0dfe3119a4d3b38d94c"
            "fa49e3b18c61eb0af9c562aa94208f3ecf9c1869e81b81cb84fef1b8450c1aa1")

prepare() {
    cd "${srcdir}"
    bsdtar -xf $pkgname-$pkgver$_pkgbeta2$_pkgpre.jar ui/images/$pkgname-logo.png
}

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/share/$pkgname/$pkgname.sh
    install -Dm644 $pkgname-$pkgver$_pkgbeta2$_pkgpre.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar
    install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
    install -Dm644 ui/images/$pkgname-logo.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
    install -d "${pkgdir}"/usr/bin/
    ln -s /usr/share/$pkgname/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname
}
