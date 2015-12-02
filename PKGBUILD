# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lostlabyrinth
pkgver=5.3.0
pkgrel=1
pkgdesc="RPG turn based game"
arch=('i686' 'x86_64')
url="http://www.lostlabyrinth.com/"
license=('GPL')
depends=('desktop-file-utils' 'libpng' 'sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer')
install=$pkgname.install
source=($pkgname.desktop $pkgname.sh)
source_x86_64=(http://www.lostlabyrinth.com/download_${pkgver}/${pkgname}_${pkgver}_64x.tar.gz)
source_i686=(http://www.lostlabyrinth.com/download_${pkgver}/${pkgname}_${pkgver}.tar.gz)
md5sums=('8feeeb9c84fdfcbc78875c6938e80c0c'
         'ea650ff17191f4adff8bcf7b8a2cf439')
md5sums_i686=('35e2c70b6ecc00fecd8cec590f6399fc')
md5sums_x86_64=('fd8138b761c48e20c831ea8c6575de09')

package () {
  cd "${srcdir}"/laby_$pkgver

  install -d -m777 "${pkgdir}"/usr/share/$pkgname
  cp -av * "${pkgdir}"/usr/share/$pkgname/
  install -Dm755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname

#fixing permissions
  find "${pkgdir}"/usr/share/$pkgname -type f -exec chmod 664 "{}" \;
  find "${pkgdir}"/usr/share/$pkgname -type f -exec chown root:users "{}" \;
  chmod 755 "${pkgdir}"/usr/share/$pkgname/laby

#.desktop file + icon
  install -Dm644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 "${srcdir}"/laby_$pkgver/laby.xpm \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.xpm
}
