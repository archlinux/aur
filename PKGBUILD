# Maintainer: Roman Lisagor <rlisagor at gmail dot com>

pkgname=cni-plugins
pkgver=0.7.4
pkgrel=1
pkgdesc="Some standard networking plugins, maintained by the CNI team"
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/plugins"
license=('Apache')
makedepends=('go')
optdepends=('cni')
depends=('glibc')
source=("https://github.com/containernetworking/plugins/archive/v${pkgver}.tar.gz")
sha512sums=('2ffe18353b525d90679eca4950e96afcaadd7c387956ef5baaf4ce97c0550315fda63403161ab8f23df086955dc2a47da612fb8d0cdd30ccfe12649393e2242c')

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
