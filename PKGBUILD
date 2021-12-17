# Maintainer: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reminduck
pkgver=1.6.2
pkgrel=1
pkgdesc='A simple reminder app made for elementaryOS with Vala and GTK'
arch=('i686' 'x86_64')
url='https://github.com/matfantinel/reminduck'
license=('GPL3')
depends=('granite')
makedepends=('ninja' 'libgee' 'granite' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matfantinel/reminduck/archive/v${pkgver}.tar.gz")
sha256sums=('14b6df32d56d4b1c6973b8380bbe1bd7de68752211c0f9d0ba6d877687e02130')

build () {
  cd "${pkgname}-${pkgver}"
  meson . build --prefix=/usr
  ninja -C build
}

package () {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  cp "${pkgdir}/usr/bin/com.github.matfantinel.reminduck" "${pkgdir}/usr/bin/reminduck"
}
