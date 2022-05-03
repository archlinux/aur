# Maintainer: Connor Nuutinen <cnuutinen@outlook.com>
# Contributor: David Santiago <demanuel@ymail.com>
# Contributor: jokersus <jokersus.cava@gmail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_binname=comma
pkgrel=1
pkgver=2022.04.0
_tarname=comma-community-${pkgver}
provides=(${_pkgname})
pkgdesc='The Integrated Development Environment for Raku (formerly Perl 6).'
arch=('any')
url='https://commaide.com/'
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=('https://commaide.com/download/community/linux'
        'comma-ide-community.desktop')
sha256sums=('e7e601b61984bc03dcf39c6b04ef2b01b241f4b9e413ce121496b668d18f5725'
            'a805e27b65c742889e2d12def48ed0e12fba0e99a32fae6f21724d5b02f7ea46')
install=comma-ide.install

package() {
  # No direct link, look at source
  tar -xzvf linux

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/icons/

  cp -a "${srcdir}"/${_tarname}/ "${pkgdir}"/opt/${pkgname}
  rm -rf "${pkgdir}"/opt/${pkgname}/jbr

  ln -s /opt/${pkgname}/bin/${_binname}.sh "${pkgdir}"/usr/bin/${_binname}
  install -m644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/

  ln -s /opt/${pkgname}/bin/comma.png ${pkgdir}/usr/share/icons/${pkgname}.png
}
