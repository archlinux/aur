# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_SRCNAME=fcitx
pkgname=fcitx5-icons
pkgdesc="Icons from fcitx4 for fcitx5"
pkgver=4.2.9.7
pkgrel=1
arch=('any')
url="https://fcitx-im.org"
license=('GPL' 'LGPL')
depends=('fcitx5')
source=("https://download.fcitx-im.org/${_SRCNAME}/${_SRCNAME}-${pkgver}_dict.tar.xz"{,.sig})
sha512sums=('b940478c648e30b2ea55903465ed02c8a0c3ae3539e4bd5b77be46a9e4d0c13ceff074ddd7532f86893111eb96308e1740db621a83fb809e4fd02256d75ebe7b'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

build() {
  cd ${_SRCNAME}-${pkgver}/data/icon

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc
  make
}

package() {
  cd ${_SRCNAME}-${pkgver}/data/icon
  make DESTDIR="$pkgdir" install
}
