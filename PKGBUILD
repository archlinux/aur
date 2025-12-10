# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

pkgname=redocly
pkgver='2.12.6'
pkgrel=1
pkgdesc="Redocly CLI toolbox with rich validation and bundling features"
arch=('any')
url="https://github.com/Redocly/redoc"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=(
  "$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/@redocly/cli/-/cli-${pkgver}.tgz"
)
sha256sums=(
  'cb05b2b52bedd20cbd4260532c73373dcb9c68bfaba27f41f2157da48dceede7'
)
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tar.gz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "${pkgdir}"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
