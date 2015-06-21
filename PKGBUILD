# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=fractal-hib
pkgver=20130613
pkgrel=1
epoch=
pkgdesc="An enthralling music puzzler experience (Humble Bundle version)"
arch=(i686 x86_64)
url="http://www.cipherprime.com/games/fractal/"
license=(custom:commercial)
groups=()
depends=(mesa libxcursor glu)
makedepends=(hib-dlagent)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('hib://Fractal_20130613_Linux_1371245691.tar.gz'
        'fractal.sh'
        'fractal.desktop')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in makepkg.conf. See http://git.ersoft.org/git/hib-dlagent.git/tree/README ."; exit 1')
noextract=()
md5sums=('4ea677cd81cccc250f4c02a618b299f5'
         'ef357ae4ef92514176959df8068c769a'
         '44d4b6f8bc260becf997c9e2382862d8')

prepare() {
  if [ "$CARCH" == x86_64 ]
  then
    _arch=x86_64
    _otherarch=x86
  else
    _arch=x86
    _otherarch=x86_64
  fi

  cd $srcdir/Fractal/Linux/
  mv Fractal.$_arch Fractal
  rm -r Fractal_Data/Mono/$_otherarch
}

package() {
  cd $srcdir/Fractal/Linux/
  install -m755 -D Fractal $pkgdir/opt/fractal/Fractal
  cp --no-preserve=mode -r Fractal_Data $pkgdir/opt/fractal/
  install -m755 -D $srcdir/fractal.sh $pkgdir/usr/bin/fractal
  install -m644 -D Fractal_Data/Resources/UnityPlayer.png $pkgdir/usr/share/icons/fractal.png
  install -m644 -D $srcdir/fractal.desktop $pkgdir/usr/share/applications/fractal.desktop
}
