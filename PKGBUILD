# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Elia Notarangelo <elia.notarangelo AT gmail DOT com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Samsagax <samsagax AT gmail DOT com>
# Contributor: simongmzlj <simongmzlj AT gmail DOT com>

pkgname=faenza-icon-theme
pkgver=1.3.1
pkgrel=6
pkgdesc='Icon theme designed for Equinox GTK theme'
url='https://gnome-look.org/content/show.php/Faenza?content=128143'
license=('GPL3')
arch=('any')
options=(!strip)
source=("http://ppa.launchpad.net/tiheum/equinox/ubuntu/pool/main/f/$pkgname/${pkgname}_${pkgver}.tar.gz")
sha512sums=('0c017ddbaa2dba485341d3bb1e321fafad026aafc893fa2519ddfd3fe0475fc8d011c99ce3de581c9b1c6aa7d250312673dda7c10bb12783db2d45816646ddc9')

package() {
  cd $pkgname-1.3
  mkdir -p "$pkgdir/usr/share/icons" "$pkgdir/usr/lib" "$pkgdir/usr/share"

  cp -rf Faenza{,-Dark,-Darkest,-Darker,-Ambiance,-Radiance} "$pkgdir/usr/share/icons/"
  cp -rf rhythmbox "$pkgdir/usr/lib/"
  cp -rf emesene "$pkgdir/usr/share/"

  # set the Arch Linux Distributor and start menu logo
  for theme in Faenza{,-Dark}; do
    for size in 22 24 32 48 64 96; do
      cd "$pkgdir/usr/share/icons/$theme/places/$size/"
      # no distributor-logo for Faenza-Dark
      [[ $theme == Faenza ]] && ln -sf distributor-logo{-archlinux,}.png
      ln -sf start-here{-archlinux,}.png
    done
    cd "$pkgdir/usr/share/icons/$theme/places/scalable/"
    # no distributor-logo for Faenza-Dark
    [[ $theme == Faenza ]] && ln -sf distributor-logo{-archlinux,}.svg
    ln -sf start-here{-archlinux,}.svg
    ln -sf start-here{-archlinux-symbolic,-symbolic}.svg
  done

  for theme in Faenza{,-Dark}; do
    cd "$pkgdir/usr/share/icons/$theme/apps/scalable/"
    ln -sf gnome-session-reboot.svg system-reboot.svg
    for size in 16 22 24 32 48 64 96; do
      cd "$pkgdir/usr/share/icons/$theme/apps/$size/"
      ln -sf gnome-session-reboot.png system-reboot.png
    done
  done
}
