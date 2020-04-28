# Maintainer: Chris Lane <aur at chrislane dot com>
_npmver=0.2.0-rc.2
pkgname=instant-markdown-d
pkgver=0.2.0_rc.2
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
sha512sums=('f452204931e66760ed311223f01c05b9fdada09f3f51650007ef54e36bf0d2d88b9b5e85062a2763bbcd2b9c6abb3bbcd0e82461309cc56e2533651113638138')

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
