# Maintainer: Jonathan Eyolfson <jon@eyl.io>
pkgname=dynamorio-bin
pkgver=11.3.0
pkgrel=1
pkgdesc="A dynamic binary instrumentation framework"
url="http://dynamorio.org"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#FIXME: Remove "-1" part on new version.
source=("https://github.com/DynamoRIO/dynamorio/releases/download/release_${pkgver}-1/DynamoRIO-Linux-${pkgver}.tar.gz")
sha256sums=('ae02049df5c4daeb82d4087aaa0d38bf58cdd26b38fb6042dccf27cbc32ceed9')

package() {
  cd "${srcdir}/DynamoRIO-Linux-${pkgver}-1"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "${pkgdir}/opt/dynamorio"
  cp -a * ${pkgdir}/opt/dynamorio

  find ${pkgdir}/opt/dynamorio/ -type f -executable -exec chmod 755 {} \;
  find ${pkgdir}/opt/dynamorio/ -type f -not -executable -exec chmod 644 {} \;
  find ${pkgdir}/opt/dynamorio/ -type d -exec chmod 755 {} \;
}
