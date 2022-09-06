# Maintainer: luisbocanegra <luis.bocanegra0 at protonmail dot com>
pkgname=kde-material-you-colors
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatic Material You Colors Generator from your wallpaper for the Plasma Desktop"
arch=('x86_64')
url="https://github.com/luisbocanegra/kde-material-you-colors"
license=('GPL3')
depends=("dbus-python" "python-numpy" "python-material-color-utilities")
optdepends=('python-colr: colored hex codes printing'
            'python-pywal: theme other programs using Material You Colors'
)
options=('!strip')
source=("${pkgname}-${pkgver}.zip::$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('61bd107c6fc1ca2f4864a3846b10e77788b09d642c76a2e54d4ac043ad84e0d0')

build() {
  cd "${pkgname}-${pkgver}"
  python -m compileall *.py
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 src/kde-material-you-colors.desktop ${pkgdir}/usr/lib/${pkgname}/kde-material-you-colors.desktop
  install -Dm644 src/sample_config.conf ${pkgdir}/usr/lib/${pkgname}/sample_config.conf
  install -Dm755 src/kde-material-you-colors ${pkgdir}/usr/lib/${pkgname}/kde-material-you-colors
  find src/ -type f -name "*.py" -exec install -Dm755 {,${pkgdir}/usr/lib/${pkgname}/}{} \;
  install -dm755 ${pkgdir}/usr/bin
  ln -s /usr/lib/${pkgname}/kde-material-you-colors ${pkgdir}/usr/bin/kde-material-you-colors
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
