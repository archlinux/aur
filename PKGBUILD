# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=nodejs-pageres
pkgver=1.3.0
pkgrel=1
pkgdesc="Get screenshots of websites in different resolutions"
arch=('i686' 'x86_64')
url="https://github.com/sindresorhus/pageres"
license=("MIT")
depends=('nodejs')
optdepends=()
source=(
    "http://registry.npmjs.org/${pkgname/nodejs-/}/-/${pkgname/nodejs-/}-${pkgver}.tgz"
    "LICENSE"
)
noextract=("${pkgname/nodejs-/}-${pkgver}.tgz")
sha256sums=(
  '58b01aeda99d2b3f32167c054b266b8cb3b32d7c248dfd6ace6a378b348fe72a'
  'a09bad52fe9deab4338f4f80105f8b8d0c10a2618a8b4517a2cf260b48d968d2'
)

package() {
  cd "${srcdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname/nodejs-/}@${pkgver}"
}
