# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=unigine-sanctuary
_pkgname=Unigine_Sanctuary
pkgver=2.3
pkgrel=3
pkgdesc="Unigine Sanctuary Benchmark"
arch=('x86_64')
url="http://www.unigine.com"
license=('custom:UNIGINE Engine')
depends=('libopenal.so=1-32'
         'lib32-libgl'
         'lib32-libxinerama'
         'lib32-libxrandr'
         )
makedepends=('patchelf'
             'lib32-openal'
             )
source=("https://assets.unigine.com/d/${_pkgname}-${pkgver}.run"
        'unigine-sanctuary'
       )
sha256sums=('28a8bbd1cb64126fadc7492304c59528c2c3ac9d53b0f1fe08a2c331703a39d5'
            '296724e5977ae81f05f479c7f91364633ce83489c7d160e8a9b03ec98926ec31'
            )

prepare() {
  sh "${_pkgname}-${pkgver}.run"

  patchelf --remove-rpath sanctuary/bin/Sanctuary
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -R "${srcdir}/sanctuary/bin/" "${pkgdir}/opt/${pkgname}/"
  cp -R "${srcdir}/sanctuary/data/" "${pkgdir}/opt/${pkgname}/"
  install "${pkgname}" -Dm755 "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "Go to http://www.unigine.com" > "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
