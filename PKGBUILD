# Submitter:   Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: T. Witt <code@amtare.eu>
# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=docsify-cli
pkgver=5.0.0
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
sha256sums=('41fa9c811081d41a681095f4dcd2281170bf880bd8fbf9f1e92dffd278753365')
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
