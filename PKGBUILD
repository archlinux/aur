# Maintainer: kolombo

pkgname=codea-geeteedee
pkgver=0.2.608
pkgrel=1
pkgdesc="GeeTeeDee is a fancy, lightweight and easy to use task management software for GTD"
arch=('i686' 'x86_64')
url="http://codea.ru/gtd/"
license=('custom')
depends=('libnotify' 'libpng12')
options=('!emptydirs')
install=geeteedee.install

_arch=i386
[ "$CARCH" = 'x86_64' ] && _arch=amd64
source=(http://codea.ru/static/${pkgname}_${pkgver}_${_arch}.deb)
md5sums=('990106f7c7ccd61fe9bf201989405faf')

if [ "$CARCH" = 'i686' ] ; then
  md5sums[0]='d2d617e7245c6e208223706b3f928ed1'  # $pkgname_$pkgver_arch.deb
fi

PKGEXT=".pkg.tar"

package() {
  msg2 "Extracting the data.tar.gz"
  tar -xzf data.tar.gz -C "$pkgdir"

  for i in 16 32 48 256; do
    install -Dm644 "$pkgdir"/opt/codea/geeteedee/logo_${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/codea-geeteedee.png"
  done

  install -Dm644 "$pkgdir"/opt/codea/geeteedee/codea-geeteedee.desktop \
    "$pkgdir/usr/share/applications/codea-geeteedee.desktop"
}
