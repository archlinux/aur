# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=nodejs-pageres
pkgver=7.0.0
pkgrel=1
epoch=2
pkgdesc="Get screenshots of websites in different resolutions"
arch=('i686' 'x86_64')
url="https://github.com/sindresorhus/pageres-cli"
license=("MIT")
depends=('nodejs' 'npm')
source=(
    "https://registry.npmjs.org/${pkgname/nodejs-/}-cli/-/${pkgname/nodejs-/}-cli-${pkgver}.tgz"
    "LICENSE"
)
noextract=("${pkgname/nodejs-/}-cli-${pkgver}.tgz")
sha256sums=(
  'a71fd1aaeed72b8a97a7f0f084358ca3a99a02ff15da0e8c0760e6cfcc12dc90'
  '48da2f39e100d4085767e94966b43f4fa95ff6a0698fba57ed460914e35f94a0'
)

package() {
  cd "${srcdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname/nodejs-/}-cli-${pkgver}.tgz"
}
