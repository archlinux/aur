# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=alcarys-complex-trial
pkgver=1.03
pkgrel=2
pkgdesc='An action-RPG style adventure (trial version)'
arch=('i686' 'x86_64')
url='http://www.modestarcade.com/games/alcaryscomplex/'
license=('custom:Commercial')
depends=('openal' 'libgl' 'openssl')
if [ $CARCH = 'x86_64' ]; then
  depends=("${depends[@]/#/lib32-}")
fi
source=('http://www.modestarcade.com/game/alcarys/Alcarys_Complex_Trial_1.03_UBU.tar.gz')
md5sums=('e0b860fe45ffed0bcda8fa50866a4592')
_installdir="/opt/$pkgname"

prepare() {
  cd "$srcdir/Alcarys_Complex_Trial"
  sed -i "s#YYAppExePath#$_installdir#" Alcarys_Complex_Trial.desktop
  sed -i 's#Categories=Games#Categories=Game#' Alcarys_Complex_Trial.desktop
}

package() {
  install -d "$pkgdir/$_installdir"

  cd "$srcdir/Alcarys_Complex_Trial"
  mv assets runner "$pkgdir/$_installdir"
  install -D Alcarys_Complex_Trial.desktop "$pkgdir/usr/share/applications/alcarys-complex-trial.desktop"

  install -d "$pkgdir/usr/bin"
  ln -s "$_installdir/runner" "$pkgdir/usr/bin/$pkgname"
}

