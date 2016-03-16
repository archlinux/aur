# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>
# Contributor: Ner0
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=xfce-theme-greybird-git
pkgver=1.6.2.r648
pkgrel=1
pkgdesc="Desktop theme suite from Xubuntu, with support for Xfce, Metacity and Unity"
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('GPL' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('elementary-xfce-icons: matching icon theme'
            'emerald: emerald theme'
            'lightdm-gtk-greeter: lightdm GTK+3 theme'
            'lightdm-unity-greeter: lightdm unity theme')
provides=('xfce-theme-greybird')
conflicts=('xfce-theme-greybird')
options=('!strip')
source=('Greybird::git://github.com/shimmerproject/Greybird.git')
md5sums=('SKIP')

pkgver() {
  cd "Greybird"
  echo $(git describe --always --abbrev=0).r$(git rev-list --count master) | sed 's|-|.|g' | sed 's|v||g'
}

package() {
  cd "${srcdir}/Greybird"

  # install emerald theme
  install -d -m 755 "${pkgdir}/usr/share/emerald/themes/Greybird"
  tar zxf Greybird.emerald -C "${pkgdir}/usr/share/emerald/themes/Greybird/"

  # create theme dirs
  install -d -m 755 "${pkgdir}/usr/share/themes/"Greybird{,-compact/xfwm4,-a11y/xfwm4,-bright/xfce-notify-4.0}

  # install compact theme
  install -m 644 "${srcdir}/Greybird/xfwm4-compact/"* "${pkgdir}/usr/share/themes/Greybird-compact/xfwm4/"

  # install accessivility theme
  install -m 644 "${srcdir}/Greybird/xfwm4-a11y/"* "${pkgdir}/usr/share/themes/Greybird-a11y/xfwm4/"

  # install xfce-notify bright
  install -m 644 "${srcdir}/Greybird/xfce-notify-4.0_bright/"* "${pkgdir}/usr/share/themes/Greybird-bright/xfce-notify-4.0/"

  # clean up
  rm -rf {.git,.gitignore,Greybird.emerald,LICENSE.{CC,GPL},README,xfwm4_compact,xfce4_ally,xfce-notify-4.0_bright}

  # install theme
  cp -r . "$pkgdir/usr/share/themes/Greybird/"
}
