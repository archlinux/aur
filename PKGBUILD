# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=3.3.1
pkgrel=1
pkgdesc="Python IDE for beginners"
arch=('any')
url="http://thonny.org"
license=('MIT')
depends=('hicolor-icon-theme' 'mypy' 'python-astroid' 'python-asttokens' 'python-docutils' 'python-jedi' \
         'python-pylint' 'python-pyserial' 'python-send2trash' 'python-setuptools' 'tk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3c75dd5f1c749eeb03a460e7ccd63208c0d99ea84cf16d0d62e8fb7229ba7365368de5cb0b1bd4d5bd6a66376369b29b48666dfea89a83c9d4b787d2da25fe90')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 "packaging/linux/org.${pkgname}.${pkgname^}.desktop" \
                  "${pkgdir}/usr/share/applications/org.${pkgname}.${pkgname^}.desktop"

  sed -i "s/Icon=t/Icon=org.${pkgname}.T/" \
         "${pkgdir}/usr/share/applications/org.${pkgname}.${pkgname^}.desktop"

  install -Dm 644 "packaging/linux/org.${pkgname}.${pkgname^}.appdata.xml" \
                  "${pkgdir}/usr/share/metainfo/org.${pkgname}.${pkgname^}.appdata.xml"

  for size in 16 22 32 48 64 128 256; do
    install -Dm 644 "packaging/icons/${pkgname}-${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/org.${pkgname}.${pkgname^}.png"
  done

  install -Dm 644 "LICENSE.txt" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
