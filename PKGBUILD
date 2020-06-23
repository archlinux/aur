# Maintainer: François-Xavier Bru <francoisxavier.bru at orange dot com>
pkgname=application-inspector-bin
_pkgname=application-inspector
pkgver=1.2.34
pkgrel=1
pkgdesc="Microsoft ApplicationInspector is a source code analyzer built for surfacing features of interest and other characteristics to answer the question 'what's in it' using static analysis with a json based rules engine (official CLI binary version)"
arch=('x86_64')
url="https://github.com/microsoft/ApplicationInspector"
license=('MIT')
provides=('application-inspector')
depends=(dotnet-runtime)
options=(staticlibs)
source=(https://github.com/microsoft/ApplicationInspector/releases/download/v${pkgver}/ApplicationInspector_linux_${pkgver}.zip)
sha256sums=('35D182337A90383E9A08C09E412E37F39B53AB03C0D6F82CE871434C11296A6E')
install=${pkgname}.install

package() {
  _pkg=ApplicationInspector_${pkgver}

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}"
  chmod -R g+w "${pkgdir}/opt/${_pkgname}"
  chmod +x ${pkgdir}/opt/${_pkgname}/ApplicationInspector.CLI
  ln -s /opt/${_pkgname}/ApplicationInspector.CLI "${pkgdir}"/usr/bin/ApplicationInspector
  ln -s /opt/${_pkgname}/ApplicationInspector.CLI "${pkgdir}"/usr/bin/application-inspector
}

