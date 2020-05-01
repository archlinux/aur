# Maintainer  : Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer  : Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>
pkgname=gvm-tools
pkgver=1.4.1
pkgrel=3
pkgdesc='greenbone-vulnerability-manager tools'
arch=('x86_64')
url='http://www.openvas.org/'
license=('GPL')
depends=('python' 'python-setuptools')
groups=('greenbone-vulnerability-manager')
# These URLs need to be manually updated on every pkgver upgrade.
# http://wald.intevation.org/frs/?group_id=29
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gvm-tools/archive/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gvm-tools/releases/download/v${pkgver}/gvm-tools-${pkgver}.tar.gz.sig")
sha512sums=('cd1049311241ad7b4a2d9648b54224ca1636f9620ffd238282bbf1089ab0c3b4e8b8f722c93c6809695bc71b0c7cb2bc3e65561b05269c7737abdc6ddca69aea'
            'SKIP')
validpgpkeys=(
              'C3B468D2288C68B9D526452248479FF648DB4530' # GVM Transfer Integrity
)
changelog=CHANGELOG.md

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  # make sure to remove the VERSION file
  rm "${pkgdir}/usr/VERSION"
}
