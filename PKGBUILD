# Maintainer: Georg Nagel <g.schlmm at gmail dot com>


_npmname=@gltf-transform/cli
pkgname=nodejs-gltf-transform-cli
pkgver="3.7.3"
pkgrel=1
pkgdesc="CLI interface to glTF Transform"
arch=(any)
url="https://gltf-transform.donmccurdy.com/"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("${pkgname}-${pkgver}.tgz::http://registry.npmjs.org/${_npmname}/-/cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=("bf82db5a31f19c3fd25363772a666d121922d6e460a376490b298e925643f371")

package() {
  # copied from: nodejs-nativefier
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Fixing permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "$pkgdir/usr/lib/node_modules/${_npmname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

