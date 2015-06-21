# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname='type-rider-hib'
pkgdesc='Play as 2 dots and travel through the ages of typographic styles and techniques'
url='http://www.bulkypix.com/game/typerider'
pkgver=1395097265
pkgrel=1
license='custom: Commercial'
arch=('i686' 'x86_64')
depends=('libglapi')
source=("hib://TypeRider_linux_${pkgver}.tar.gz"
        'type-rider.desktop')
md5sums=('b7eff6824e31b2c64e663a24ac495ec0'
         '4b6cfde1ade0f7c953efe06f70b3bbc7')

package() {
  cd "$srcdir/TypeRider"

  _arch='x86_64'
  _otherarch='x86'
  if [ "$CARCH" = 'i686' ]; then
    _64="$_arch"
    _arch="$_otherarch"
    _otherarch="$_64"
  fi

  rm -r "TypeRider.${_otherarch}" \
        "TypeRider_Data/Mono/${_otherarch}" \
        "TypeRider_Data/Plugins/${_otherarch}"

  _installdir='opt/type-rider/'
  _exe="TypeRider.${_arch}"
  install -Dm755 "$_exe" "$pkgdir/$_installdir/$_exe"
  _bindir="$pkgdir/usr/bin/"
  install -d "$_bindir"
  ln -s "/$_installdir/$_exe" "$_bindir/type-rider"

  install -Dm644 'TypeRider_Data/Resources/UnityPlayer.png' "$pkgdir/usr/share/pixmaps/type-rider.png"
  mv 'TypeRider_Data' "$pkgdir/${_installdir}"

  install -Dm644 "$srcdir/type-rider.desktop" "$pkgdir/usr/share/applications/type-rider.desktop"
}

