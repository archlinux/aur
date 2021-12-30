# Maintainer: Paragoumba <paragoumba at protonmail dot com>
# Contributor: maniacata <maniaciachao at gmail dot com>
# Contributor: Martin Thierer <thierer@web.de>
# Contributor: Amy Wilson <awils_1[at]xsmail[dot]com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

pkgname=logisim-evolution-bin
_name=logisim-evolution
pkgver=3.7.2
pkgrel=1
pkgdesc='An educational tool for designing and simulating digital logic circuits (binary version)'
provides=('logisim-evolution')
conflicts=('logisim-evolution-git' 'logisim-evolution')
arch=('any')
url="https://github.com/reds-heig/logisim-evolution"
license=('GPL3')
depends=('java-runtime>=10' 'bash' 'hicolor-icon-theme')
makedepends=('java-environment>=10')
source=("${_name}-${pkgver}.jar::https://github.com/reds-heig/logisim-evolution/releases/download/v${pkgver}/logisim-evolution-${pkgver}-all.jar"
    'logisim-evolution.desktop'
    'logisim-evolution.sh'
    'logisim-evolution.xml')
sha256sums=('448fa2a0e1e3d775001ae3f3b1e000cb7a100506248dafee7238f840c791661c'
            'c374a6cf85c020014b1c446c0a871842d98a283a14338662a2230e4110a6765e'
            'd5975cc0025905ab8a8a451ce4362ba876bed88008d3a5b2c0a7f664a85da1ba'
            '7d071777cfeb56d2ff957d8e63d2eb45157ff00f8c1c6943db4d5fee774d94fc')

package() {
    cd "$srcdir"

    jar xf "${_name}-${pkgver}.jar" "resources/logisim/img/"

    install -Dm644 ${_name}-${pkgver}.jar "${pkgdir}/usr/share/java/${_name}/${_name}.jar"
    install -Dm644 ${_name}.xml "${pkgdir}/usr/share/mime/packages/${_name}.xml"
    install -Dm644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"

    for SIZE in 16 32 48 128 256; do
      install -Dm644 "resources/logisim/img/logisim-icon-${SIZE}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_name}.png"
    done

    install -Dm755 "${_name}.sh" "${pkgdir}/usr/bin/${_name}"
}
