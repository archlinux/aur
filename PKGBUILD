# Maintainer: farwayer <farwayer@gmail.com>
# Contributor: rafauke <m6vuthzbw at mozmail dot com>

_pkgnamebase=react-native-debugger

pkgname=react-native-debugger-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="The standalone app for React Native Debugger, with React DevTools / Redux DevTools"
arch=('x86_64')
url='https://github.com/jhen0409/react-native-debugger'
depends=(
  'nss'
  'at-spi2-core'
  'gtk3'
  'alsa-lib'
)
makedepends=('gendesk' 'unzip')
license=('MIT')
source=(
  "${_pkgnamebase}-${pkgver}.zip::$url/releases/download/v$pkgver/rn-debugger-linux-x64.zip"
  "LICENSE::https://raw.githubusercontent.com/jhen0409/react-native-debugger/master/LICENSE.md"
  "${_pkgnamebase}.png"
)
sha512sums=('4d9145e46aed4a893292fb85cbd63f05130bfe0ef3f1d7522fb434083b4c5d9c26d426d81798e9a8b48fc4faabfeae7efaad2862ff90b0b62221f37e6d259d43'
            'c48c6947c7d1309b9ce0ceabb0550d0c758f4f35f6b3237f2071fa8211f71e4ddac8d66f108c64a0414b5b0e0e7b681f27461485bd3de0d48489687c5b666a64'
            '44903f292332e449d94459eb1c4a7f340ca13177418b171401f6c0c7d061cd52aa8c76fff4905505f5275fede0ddc35574bceb41cef6d581802f8e2d555600b0')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgnamebase}"
  mkdir -p "${pkgdir}/opt/${_pkgnamebase}"
  mkdir -p "$pkgdir/usr/bin"
  unzip ${_pkgnamebase}-${pkgver}.zip -d ${pkgdir}/opt/${_pkgnamebase}
  ln -s /opt/${_pkgnamebase}/${_pkgnamebase} "${pkgdir}/usr/bin/${_pkgnamebase}"
  gendesk -f -n \
          --name "React Native Debugger" \
          --pkgname "${_pkgnamebase}" \
          --pkgdesc "${pkgdesc}" \
          --exec="${_pkgnamebase} --no-sandbox %U" \
          --categories=Application\;Development \
          --icon ${_pkgnamebase}
  install -Dm644 ${_pkgnamebase}.desktop "${pkgdir}/usr/share/applications/${_pkgnamebase}.desktop"
  install -Dm644 ${_pkgnamebase}.png "${pkgdir}/usr/share/pixmaps/${_pkgnamebase}.png"
}
