# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=nodejs-pageres
pkgver=3.1.0
pkgrel=1
epoch=2
pkgdesc="Get screenshots of websites in different resolutions"
arch=('i686' 'x86_64')
url="https://github.com/sindresorhus/pageres-cli"
license=("MIT")
depends=('nodejs' 'npm')
source=(
    "http://registry.npmjs.org/${pkgname/nodejs-/}-cli/-/${pkgname/nodejs-/}-cli-${pkgver}.tgz"
    "LICENSE"
)
noextract=("${pkgname/nodejs-/}-cli-${pkgver}.tgz")
sha256sums=(
  '0d551cf216b064c2e9fb54f7234cb5b81dd4f165a6a7bf83b2d93d657f0c49f2'
  '2bc4beb49d4852de32aecc72c9db954596cfcfcdc980fd7693adc89d5aa5d31f'
)

package() {
  cd "${srcdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname/nodejs-/}-cli-${pkgver}.tgz"
}
