# Maintainer: David Runge <dave@sleepmap.de>

pkgname=grub-customizer
pkgver=5.1.0
pkgrel=2
pkgdesc="A graphical grub2 settings manager"
url="https://launchpad.net/grub-customizer"
arch=('x86_64')
license=('GPL3')
depends=('grub' 'gtkmm3' 'libarchive')
optdepends=('hwinfo: Additional hardware information'
            'polkit: Run grub-customizer from menu')
makedepends=('cmake')
backup=('etc/grub-customizer/grub.cfg')
source=("https://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}_${pkgver}.tar.gz"
        'grub.cfg')
sha512sums=('d79c7996afd8486483d4460432207dc19315d7377dcfd2fd6a4594e64c6750bbae36f96c395c4a9748d0ff43c6095399d822fc6a23beedbc8769802818dfa11f'
            '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')

prepare(){
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build(){
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd "${pkgname}-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
  # configuration
  install -vDm 644 "${srcdir}/grub.cfg" -t "${pkgdir}/etc/${pkgname}/"
  # additional documentation
  install -vDm 644 ../{changelog,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
