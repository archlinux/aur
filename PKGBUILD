# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=3.2.7
pkgrel=1
pkgdesc="Python IDE for beginners."
arch=('any')
url="http://thonny.org"
license=('MIT')
depends=('hicolor-icon-theme' 'mypy' 'python-astroid' 'python-asttokens' 'python-docutils' 'python-jedi' \
         'python-pylint' 'python-pyserial' 'python-send2trash' 'python-setuptools' 'tk')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/${pkgname}/${pkgname}/tar.gz/v${pkgver}")
sha512sums=('2b87786bfd8b23589458ca9828302193b3449638261888f18177fa38bc826098bc20eed32d9daa57cbcc998e9405f52568bbf8fdb9c43e68bae86daaaed7ac37')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 "packaging/linux/org.thonny.Thonny.desktop" \
                  "${pkgdir}/usr/share/applications/org.thonny.Thonny.desktop"

  sed -i 's/Icon=t/Icon=org.thonny.T/' \
         "${pkgdir}/usr/share/applications/org.thonny.Thonny.desktop"

  install -Dm 644 "packaging/linux/org.thonny.Thonny.appdata.xml" \
                  "${pkgdir}/usr/share/metainfo/org.thonny.Thonny.appdata.xml"

  for size in 16 22 32 48 64 128 256; do
    install -Dm 644 "packaging/icons/${pkgname}-${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/org.thonny.Thonny.png"
  done

  install -Dm 644 "LICENSE.txt" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
