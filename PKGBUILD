# Contributor: taotieren <admin@taotieren.com>

pkgname=wifiassist
_pkgname=WifiAssist
pkgver=0.8
pkgrel=1
pkgdesc="The easy way to use Wifi through PC."
arch=('any')
url="https://github.com/lzjqsdd/WifiAssist"
license=('BSD')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
#replaces=(${pkgname})
depends=( 'qt5-tools' 'qt5-base' 'qt5-declarative' 'qt5-webkit' 'sqlite')
makedepends=('qconf')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0284688369ef17af12db1f283c43de9316b9609feef10488c786d96770e5250b')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    qmake ./${_pkgname}.pro
    make
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/INSTALL/${_pkgname}" "${pkgdir}/usr/local/${_pkgname}/${_pkgname}"
    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/INSTALL/bin/${_pkgname}.desktop" "${pkgdir}/usr/local/share/applications/${_pkgname}.desktop"
    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/INSTALL/etc/com.lzjqsdd.WifiAssist.policy" "${pkgdir}/usr/share/polkit-1/actions/com.lzjqsdd.WifiAssist.policy"
    cd "${srcdir}/${_pkgname}-${pkgver}/INSTALL/"
    cp -r bin/ etc/ img/ "${pkgdir}/usr/local/${_pkgname}/"
    install -dm0755 "${pkgdir}/usr/bin"
    ln -sf "/usr/local/WifiAssist/WifiAssist" "${pkgdir}/usr/bin/WifiAssist"

}
