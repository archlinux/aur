# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=dream-prompter
pkgver=1.3.0
pkgrel=1
pkgdesc="AI-powered GIMP plugin for image generation and editing using multiple Replicate models"
arch=('x86_64')
url='https://github.com/zquestz/dream-prompter'
license=('MIT')
depends=('gimp>=3.0' 'python>=3.8' 'python-replicate-git')
makedepends=('git' 'gettext' 'python')
provides=('dream-prompter')
conflicts=('dream-prompter')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zquestz/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a521b4c02122fa0ce6e1c09e8acf209dafa06a13999910db763afc66da637c0')

build() {
  cd ${pkgname}-${pkgver}

  python3 scripts/build-translations.py
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}"
  install -m644 *.py "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  cp -r models "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  cp -r locale "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/"
  chmod +x "${pkgdir}/usr/lib/gimp/3.0/plug-ins/${pkgname}/dream-prompter.py"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
