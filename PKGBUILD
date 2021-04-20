# Maintainer: Hao Long <aur@esd.cc>

pkgname=mercury-parser
pkgver=2.2.0
pkgrel=2
pkgdesc="Extract meaningful content from the chaos of a web page (@postlight version)"
arch=('any')
url="https://mercury.postlight.com/web-parser/"
license=('Apache')
depends=('nodejs')
makedepends=('npm' 'git')
source=("https://registry.npmjs.org/@postlight/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('cb44d169a74e0163f3279f996ac44a98a0da439a65bc6ebc26ea1c10c9b0231f')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
