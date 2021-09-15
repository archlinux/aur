# Maintainer: Hao Long <aur@esd.cc>

pkgname=mercury-parser
pkgver=2.2.1
pkgrel=1
pkgdesc="Extract meaningful content from the chaos of a web page (@postlight version)"
arch=('any')
url="https://mercury.postlight.com/web-parser/"
license=('Apache')
depends=('nodejs')
makedepends=('npm' 'git')
source=("https://registry.npmjs.org/@postlight/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
b2sums=('96ce7278e6f29183442bab45785c331bd7cb82844a17fc081f7dad0fb75d0b66303eff680611a329cb15dec6b82b4d11e43421c93b3199c71080d9f680457f76')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
