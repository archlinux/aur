# Maintainer: bipin Kumar <kbipinkumar@pm.me>

pkgname=adapterremoval
pkgver=2.3.3
pkgrel=1
pkgdesc='Remove remnant adapter sequences from High-Throughput Sequencing (HTS) data trims low quality bases from the 3 prime end'
arch=('x86_64')
url='https://github.com/MikkelSchubert/adapterremoval'
license=('GPL3')
depends=('glibc' 'gcc-libs' 'bzip2' 'zlib')
makedepends=('python-sphinx' 'libdeflate' 'isa-l')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/MikkelSchubert/adapterremoval/archive/refs/tags/v${pkgver}.tar.gz
        'arch-destdir.patch'
        )
sha256sums=('a1bdc054319ede085fc8a4e9867c23ffed7df5e97b99d52221b7c587d19418fc'
            '24f46744805fb8d4a506c05de47d1a2ab77897950057e72db682165ae412a8b3')
prepare() {
  cp *.patch ${pkgname}-${pkgver}
  cd "${pkgname}-${pkgver}"
  # patch Makefile to be inline with archlinux build guidelines
  patch -p1 < arch-destdir.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make everything
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
