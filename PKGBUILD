# Maintainer: Chris Lane <aur at chrislane dot com>
_npmver=0.2.0
pkgname=instant-markdown-d
pkgver=0.2.0
pkgrel=1
pkgdesc='Instantly-updating Markdown Server'
arch=('any')
url='https://github.com/suan/instant-markdown-d'
license=('APACHE')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${_npmver}.tgz")
noextract=("${pkgname}-${_npmver}.tgz")
sha512sums=('f1e55c5b261f943eec1b5999384b9e4b047032c9a615e0b2d617328e427ea0bb64fc929c3205163c6b34a5fe5d997157c512623cfc70a9085a900abb45596df5')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "$srcdir/${pkgname}-${_npmver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
