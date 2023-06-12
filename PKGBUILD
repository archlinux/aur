# Maintainer: Georg Nagel <g.schlmm at gmail dot com>


_npmname=@gltf-transform/cli
pkgname=nodejs-gltf-transform-cli
pkgver="3.4.0"
pkgrel=1
pkgdesc="CLI interface to glTF Transform"
arch=(any)
url="https://gltf-transform.donmccurdy.com/"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("${pkgname}-${pkgver}.tgz::http://registry.npmjs.org/${_npmname}/-/cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=("ed0f5116b03036c78231193d71e34276b50c4f7d8e38fdf5582954193a7cb35c")

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

