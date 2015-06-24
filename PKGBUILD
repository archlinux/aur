# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=nodejs-pageres
pkgver=1.0.0
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
  '5752c99815f55290f6842ef872e85ab2190aa2d708ba3763076609ded076105e'
  'a09bad52fe9deab4338f4f80105f8b8d0c10a2618a8b4517a2cf260b48d968d2'
)

package() {
  cd "${srcdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname/nodejs-/}-cli@${pkgver}"
}
