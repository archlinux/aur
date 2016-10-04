# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=mystudio
pkgver=3.0.0
pkgrel=1
pkgdesc="Rizzoli Education - Il sistema digitale per studenti e insegnati."
arch=('i686' 'x86_64')
url="http://mystudio.rizzolieducation.it/"
license=('unknown')
depends=("fontconfig" "libpulse" "gtk2" "xdg-utils" "postgresql-libs" "qt5-webkit" "qt5-tools" "qt5-svg")

[[ $CARCH == "i686" ]] && _debname=setup_MyStudio_300_Linux_x86_32bit.deb
[[ $CARCH == "x86_64" ]] && _debname=setup_MyStudio_300_Linux_x86_64bit.deb

source_i686+=(http://openbook.rizzolieducation.it/linux/${_debname})
source_x86_64+=(http://openbook.rizzolieducation.it/linux/${_debname})
md5sums_i686=('52e60a700ab79d7d18df5e95c57e8073')
md5sums_x86_64=('6d81df59811ddb39514ff1c2791d5c2c')

noextract=(${_debname})

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null
  tar -xf control.tar.gz > /dev/null
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/bin
  install -m644 usr/share/applications/MyStudio.desktop "$pkgdir"/usr/share/applications/MyStudio.desktop
  install -m755 usr/bin/mystudio "$pkgdir"/usr/bin/mystudio

  cp -dpr --no-preserve=ownership opt "$pkgdir"
}
