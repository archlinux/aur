
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=dream-background-remover
pkgver=1.0.3
pkgrel=1
pkgdesc="GIMP Plugin which integrates Replicate's AI for image background removal"
arch=('x86_64')
url='https://github.com/zquestz/dream-background-remover'
license=('MIT')
depends=('gimp>=3.0' 'python>=3.8' 'python-replicate-git')
makedepends=('git' 'gettext' 'python')
provides=('dream-background-remover')
conflicts=('dream-background-remover')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zquestz/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fd376e790c76f9335e6c896228e97bd1fedeee352041a7f3ac780b8a5885814a')

build() {
  cd ${pkgname}-${pkgver}

  python3 scripts/build-translations.py
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}"
  install -m644 *.py "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  cp -r locale "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  chmod +x "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/dream-background-remover.py"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
