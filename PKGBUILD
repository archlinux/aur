# Maintainer: Connor Nuutinen <cnuutinen@outlook.com>
# Contributor: David Santiago <demanuel@ymail.com>
# Contributor: jokersus <jokersus.cava@gmail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_binname=comma
pkgrel=1
pkgver=2022.07.0
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
sha256sums=('e812ba0c016995bad9f7c6cc1d736da71d14e69021c9685931f9a446903058f0'
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
