pkgname=apache-flex-sdk
pkgver=4.12.0
pkgrel=1
pkgdesc="The open-source framework for building expressive web and mobile applications"
arch=('any')
license=('Apache')
url='http://flex.apache.org/'
depends=('java-environment')
source=(
    "http://ftp.twaren.net/Unix/Web/apache/flex/4.12.0/binaries/apache-flex-sdk-4.12.0-bin.tar.gz"
    "http://download.macromedia.com/get/flashplayer/updaters/11/playerglobal11_1.swc"
    "apache-flex-sdk.sh"
)
sha256sums=(
    '8d2715cf349b44b5028bff765902e258af4b6c0a49ee225cfcd1d28005f8c890'
    '2bbd5ffff3bb20c117db7206080079479b04c4b55d68dd21ab31b6566c99fb6b'
    '520ae01482825ef28da42c03b3cbadd3d62155ed074d737f3672980f0a97a3fd'
)
install=apache-flex-sdk.install
options=('!strip')
noextract=('playerglobal11_1.swc')

_binary_name="${pkgname}-${pkgver}-bin.tar.gz"

build() {
    cd ${srcdir}/${pkgname}-${pkgver}-bin/
    mkdir -p player/11.1/
    cp ../playerglobal11_1.swc player/11.1/playerglobal.swc
}

package() {
    cd ${srcdir}
    install -dDm755 ${pkgdir}/opt
    cp -dr --no-preserve=ownership ${pkgname}-${pkgver}-bin ${pkgdir}/opt/${pkgname}
    install -dDm755 ${pkgdir}/etc/profile.d/
    install -Dm755 apache-flex-sdk.sh ${pkgdir}/etc/profile.d/
}
