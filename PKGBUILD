
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=dream-prompter
pkgver=1.0.3
pkgrel=1
pkgdesc="GIMP Plugin which integrates Google's Nano Banana AI for image creation and editing"
arch=('x86_64')
url='https://github.com/zquestz/dream-prompter'
license=('MIT')
depends=('gimp>=3.0' 'python>=3.8' 'python-google-genai')
makedepends=('git' 'gettext' 'python')
provides=('dream-prompter')
conflicts=('dream-prompter')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zquestz/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94a986874b86b61e340ca0f0def28813e9239506ed67277e21e4c7798d732ac7')

build() {
  cd ${pkgname}-${pkgver}

  python3 scripts/build-translations.py
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}"
  install -m644 *.py "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  cp -r locale "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  chmod +x "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/dream-prompter.py"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
