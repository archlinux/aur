# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=clocker
pkgver=2.0.1
pkgrel=1
pkgdesc="Tracks project hours"
arch=(any)
url="https://github.com/substack/${pkgname}"
license=(MIT)
depends=(nodejs)
makedepends=(npm python)
source=(${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('0ba2eb226d39ca4b81d6ff417ffee8b52ca2c3c970fdf289a310afa25e93f3708a9c2ab49ac6b4d3762b7c3578d1a75419e91070fea7d583106c74f1ec87bebd')

package() {
  export NODE_ENV=production

  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/" "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/lib/node_modules/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"

  ### cleanup ###
  cd "${pkgdir}/usr/lib/node_modules/${pkgname}/"
  find node_modules -type f \( -name '*.o' -or -name '*.o.d' -or -name '*.md' \) -delete
  cd node_modules/classic-level
  rm -rf prebuilds/ deps/ build/Release/{obj.target,.deps}
  chown -R root:root "${pkgdir}/"
}
