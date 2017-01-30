# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lostlabyrinth
pkgver=5.3.1
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
sha256sums=('9afba07eb44e373d93502029b047b38ce9a081a5a3c013785f9150aa6599f3db'
            'c708888fb9116291811576f5dd743b538e7ad8b8186d237ffc2d64cf3f316578')
sha256sums_i686=('f0473f1ae7dcbbe7b5fd75410af01976108665900dea7b4d86bc37d6c8dcd915')
sha256sums_x86_64=('a9c4c61c91d094bb47051c0f677aaa1ab619206df522ac45ab02fb0387c9c212')

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
