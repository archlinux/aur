# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

pkgname=redocly
pkgver='2.0.7'
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
  '00487b608f808e59b1ce6e649e907c995fa8c63a6db8253d3664fbbb2906cc69'
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
