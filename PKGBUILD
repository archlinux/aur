# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat-git
pkgver=3.30+43+g55f4d636
pkgrel=1
pkgdesc='Multithreaded advanced password recovery utility'
url='https://hashcat.net/hashcat'
arch=('i686' 'x86_64')
depends=('gmp' 'opencl-icd-loader')
optdepends=('libxnvctrl: NVIDIA X driver configuration support')
makedepends=('git' 'opencl-headers')
license=('MIT')
provides=('hashcat')
conflicts=('hashcat')
source=(${pkgname}::git+https://github.com/hashcat/hashcat)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed -r 's|v?(.+)|\1|'|sed 's|-|+|g'
}

build() {
  cd ${pkgname}
  make PREFIX=/usr hashcat_shared
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm 644 docs/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
