# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Antonio Vázquez <antoniovazquezblanco[at]gmail[dot]com>

pkgname=firmware-mod-kit
pkgver=0.99
pkgrel=7
pkgdesc='Allows easy deconstruction and reconsutrction of firmware images for various embedded devices'
url='http://code.google.com/p/firmware-mod-kit/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-magic' 'zlib' 'xz')
options=('!strip')
source=(${pkgname}-${pkgver}.tar.gz::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/firmware-mod-kit/fmk_099.tar.gz)
sha512sums=('a5261935e42446568c0c0d4c4fc1beff18c5aa7b85b1aa3398dfeaf80c8bdbb4fb2a6fb4945defc29599d6e58f1553e80e8bb755da4d98f79e99447f0c3414b1')

prepare() {
  cd fmk/src
  sed -r 's|(/usr/bin/env) python|\1 python2|g' -i binwalk-1.0/src/bin/binwalk-script
}

build() {
  cd fmk/src
  ./configure
  make
}

package() {
  install -d "${pkgdir}/opt"
  find fmk -name '*.o' -delete
  mv fmk "${pkgdir}/opt/firmware-mod-kit"
}

# vim: ts=2 sw=2 et:
