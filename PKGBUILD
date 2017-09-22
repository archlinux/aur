# Maintainer: Roman Lisagor <rlisagor at gmail dot com>

pkgname=cni-plugins
pkgver=0.6.0
pkgrel=1
pkgdesc="Some standard networking plugins, maintained by the CNI team"
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/plugins"
license=('Apache')
makedepends=('go')
optdepends=('cni')
depends=('glibc')
source=("https://github.com/containernetworking/plugins/archive/v${pkgver}.tar.gz")
sha512sums=('4b3c1901154eb1af86dc35888fda7b7666ee88d2cf728fb09182df5385d32b747de34c5c01598e1f37ae1e3497dbf5af2bc6ad6f737e683ccfccf9c1860cf6dc')

build() {
  cd "${srcdir}/plugins-${pkgver}"
  ./build.sh
}

package() {
  cd "${srcdir}/plugins-${pkgver}"
  mkdir -p "${pkgdir}/opt/cni/"
  cp -dr --no-preserve=ownership bin "${pkgdir}/opt/cni/"

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
