# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao at gmail dot com>

pkgname=redoc-cli
pkgver=0.13.21
pkgrel=1
pkgdesc="ReDoc's Command Line Interface"
arch=('any')
url="https://github.com/Redocly/redoc"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
)
sha256sums=(
  'a11f6ae0d9279b37dabd74837ff74977ff11338e6e99e9f365e1192b66d2234f'
)
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "${pkgdir}"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
