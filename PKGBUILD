# Maintainer: max.bra <max dot bra at alice dot it>

pkgname=mystudio
pkgver=3.1.6
pkgrel=1
pkgdesc="Rizzoli Education - Il sistema digitale per studenti e insegnati."
arch=('x86_64')
url="http://www.rizzolieducation.it/scuola/mystudio-download/"
license=('unknown')
depends=("fontconfig" "libpulse" "gtk2" "xdg-utils" "postgresql-libs" "qt5-webkit" "qt5-tools" "qt5-svg" "vlc" "lame" "gstreamer0.10-base")

_debname=setup_MyStudio_3.1.6_Linux_x86_64bit.deb

source=(http://openbook.rizzolieducation.it/linux/setup_MyStudio_${pkgver}_Linux_x86_64bit.zip)
md5sums=('a9b6d0d205706dcd1c15f9f07a7e8096')

# noextract=(${_debname})

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "${_debname}" > /dev/null
  tar -xf data.tar.xz > /dev/null

  find ./opt/ -type d -exec chmod 755 '{}' \;
  find ./opt/rcs/bin -type f -exec chmod 755 '{}' \;
  find ./opt/rcs/lib -type f -exec chmod 755 '{}' \;
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/share/applications
  install -dm755 "$pkgdir"/usr/bin
  install -m644 usr/share/applications/MyStudio.desktop "$pkgdir"/usr/share/applications/MyStudio.desktop
  install -m755 usr/bin/mystudio "$pkgdir"/usr/bin/mystudio

  cp -dpr --no-preserve=ownership opt "$pkgdir"
}
