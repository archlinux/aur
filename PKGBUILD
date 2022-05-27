# Submitter:   Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: T. Witt <code@amtare.eu>
# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=docsify-cli
pkgver=4.4.4
pkgrel=1
pkgdesc="A magical documentation generator"
arch=(any)
url="https://github.com/docsifyjs/docsify-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('docsify')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha256sums=('d8b2a3b6e736b6999534bad0b717958b1c5dd3df392498c030971b342de7c565')
options=(!strip)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  cd "${pkgdir}"
  chown -R root:root .

  # install LICENSE
  cd "${pkgdir}/usr"
  install -Dm644 "lib/node_modules/${pkgname}/LICENSE" "share/licenses/${pkgname}/LICENSE"
}
