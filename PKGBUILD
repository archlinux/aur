# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

pkgname=redocly
pkgver='1.10.5'
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
  '266854ea4195874c77e5bae9cceb7d3f670e1d97101dbb9f27bd69bd42a5a9da'
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
