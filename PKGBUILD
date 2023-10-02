# Maintainer: Chris Lane <aur at chrislane dot com>
_npmver=0.3.0
pkgname=instant-markdown-d
pkgver=0.3.0
pkgrel=1
pkgdesc='Small instant Markdown preview server'
arch=('any')
url='https://github.com/instant-markdown/instant-markdown-d'
license=('APACHE')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${_npmver}.tgz")
noextract=("${pkgname}-${_npmver}.tgz")
sha512sums=('867f89c85a4e9b0045000dea375eda2bb84ca4d337ff7fddaa7f2194c667ca59202025e7d06fa2091b89a3c4e0616c33c9d8ac067c1bfdc010f28871a248eb39')

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
