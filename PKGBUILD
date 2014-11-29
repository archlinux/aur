# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lostlabyrinth
pkgver=5.2.1
pkgrel=1
pkgdesc="RPG turn based game"
arch=('i686' 'x86_64')
url="http://www.lostlabyrinth.com/"
license=('GPL')
depends=('desktop-file-utils' 'libpng' 'sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer')
install=$pkgname.install

if [ "$CARCH" = x86_64 ]
  then
    source=(http://www.lostlabyrinth.com/download_${pkgver}/${pkgname}_${pkgver}_64x.tar.gz \
            $pkgname.desktop \
            $pkgname.sh)
md5sums=('5e4f0f2f5a2bbe7839aca23dd3833dd7'
         '8feeeb9c84fdfcbc78875c6938e80c0c'
         'ea650ff17191f4adff8bcf7b8a2cf439')
  else
    source=(http://www.lostlabyrinth.com/download_${pkgver}/${pkgname}_${pkgver}.tar.gz \
            $pkgname.desktop \
            $pkgname.sh)
md5sums=('58fd0fb2b8a10d023f824f02989b8f9c'
         '8feeeb9c84fdfcbc78875c6938e80c0c'
         'ea650ff17191f4adff8bcf7b8a2cf439')
fi

package () {
  cd "${srcdir}"/laby_$pkgver

  install -d -m777 "${pkgdir}"/usr/share/$pkgname
  cp -av * "${pkgdir}"/usr/share/$pkgname/
  install -D -m755 "${srcdir}"/$pkgname.sh "${pkgdir}"/usr/bin/$pkgname

#fixing permissions
  find "${pkgdir}"/usr/share/$pkgname -type f -exec chmod 664 "{}" \;
  find "${pkgdir}"/usr/share/$pkgname -type f -exec chown root:users "{}" \;
  chmod 755 "${pkgdir}"/usr/share/$pkgname/laby

#.desktop file + icon
  install -D -m644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/laby_$pkgver/laby.xpm \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.xpm
}
