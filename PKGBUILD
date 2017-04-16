# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=mystudio
pkgver=3.1.5
pkgrel=1
pkgdesc="Rizzoli Education - Il sistema digitale per studenti e insegnati."
arch=('i686' 'x86_64')
url="http://mystudio.rizzolieducation.it/"
license=('unknown')
depends=("fontconfig" "libpulse" "gtk2" "xdg-utils" "postgresql-libs" "qt5-webkit" "qt5-tools" "qt5-svg" "vlc" "lame" "gstreamer0.10-base")

[[ $CARCH == "i686" ]] && _debname=setup_MyStudio_315_Linux_x86_32bit.deb
[[ $CARCH == "x86_64" ]] && _debname=setup_MyStudio_315_Linux_x86_64bit.deb

source_i686+=(http://openbook.rizzolieducation.it/linux/${_debname})
source_x86_64+=(http://openbook.rizzolieducation.it/linux/${_debname})
md5sums_i686=('b83d78c1ad87712435cc5485362aade7')
md5sums_x86_64=('b83d78c1ad87712435cc5485362aade7')

noextract=(${_debname})

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/bin
  install -m644 usr/share/applications/MyStudio.desktop "$pkgdir"/usr/share/applications/MyStudio.desktop
  install -m755 usr/bin/mystudio "$pkgdir"/usr/bin/mystudio

  cp -dpr --no-preserve=ownership opt "$pkgdir"
}
