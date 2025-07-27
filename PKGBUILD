# Maintainer: kajoox <kayquesousa02004@gmail.com>
# Contributor: maniacata <maniaciachao at gmail dot com>
# Contributor: Martin Thierer <thierer@web.de>
# Contributor: Amy Wilson <awils_1[at]xsmail[dot]com>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Agustin Borgna <hello[at]aborgna.com.ar>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Renan Birck <renan.ee.ufsm at gmail.com>

pkgname=logisim-ita-bin
_name=logisim-ita
pkgver=2.16.2.0
pkgrel=1
pkgdesc='An educational tool for designing and simulating digital logic circuits (Italian fork)'
arch=('any')
url="https://github.com/LogisimIt/Logisim"
license=('GPL3')
depends=('java-runtime>=8' 'bash' 'hicolor-icon-theme' 'unzip')
noextract=("${_name}-${pkgver}.jar")
source=("${_name}-${pkgver}.jar::https://github.com/LogisimIt/Logisim/releases/download/v${pkgver}/Logisim-ITA.jar"
    'logisim-ita.desktop'
    'logisim-ita.sh'
    'logisim-ita.xml')
sha256sums=('ebf7a8c94de42c5efc3373a41cfbd1bb52c4c94cda5d0fc16dfa06e6e47d5a03'
            '90e3ce76ea67130895dbea7329a16c2c31c4d5581d8053b7c20394055a2bbbe6'
            'ed3efbd2535673ffbf72c2f39baab90e0bae0f89fc62f226eb5fa47fccf928b3'
            'e591a41656374fee3caa2730706bc86ef61076f6153e52a0e263b055031499eb')

package() {
    cd "$srcdir"

    # Extrair apenas os recursos necessários
    unzip -j -o -q "${_name}-${pkgver}.jar" "resources/logisim/img/logisim-icon-*.png" 2>/dev/null || true

    install -Dm644 ${_name}-${pkgver}.jar "${pkgdir}/usr/share/java/${_name}/${_name}.jar"
    install -Dm644 ${_name}.xml "${pkgdir}/usr/share/mime/packages/${_name}.xml"
    install -Dm644 ${_name}.desktop "${pkgdir}/usr/share/applications/${_name}.desktop"

    for SIZE in 16 20 24 48 64 128; do
      if [ -f "logisim-icon-${SIZE}.png" ]; then
        install -Dm644 "logisim-icon-${SIZE}.png" \
          "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_name}.png"
      fi
    done

    install -Dm755 "${_name}.sh" "${pkgdir}/usr/bin/${_name}"
}