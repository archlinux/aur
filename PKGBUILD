# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redoc-cli
pkgver=0.10.4
pkgrel=2
pkgdesc="ReDoc's Command Line Interface"
arch=('any')
url="https://github.com/Redocly/redoc"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
)
sha256sums=(
  'b0baae4b1d21d4a46cfea5e69b4e9c72bcda9da89b6c428fad6747f57dd0b8c1'
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

# vim:set ts=2 sw=2 et:
