# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>
# Contributor: Ner0
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=xfce-theme-greybird-git
pkgver=1.5.3.14.g06bf0cb.r604.06bf0cb
pkgrel=1
pkgdesc="Desktop theme suite from Xubuntu, with support for Xfce, Metacity and Unity"
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('GPL' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('elementary-xfce-icons: matching icon theme'
            'emerald: emerald theme'
            'lightdm-gtk2-greeter: lightdm GTK+2 theme'
            'lightdm-gtk3-greeter: lightdm GTK+3 theme'
            'lightdm-unity-greeter: lightdm unity theme')
provides=('xfce-theme-greybird')
conflicts=('xfce-theme-greybird')
options=('!strip')
source=('git://github.com/shimmerproject/Greybird.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Greybird"
  echo $(git describe --always).r$(git rev-list --count master).$(git rev-parse --short master) | sed 's|-|.|g' | sed 's|v||g'
}

package() {
  cd "$srcdir/Greybird"

  # install emerald theme
  install -d -m 755 "$pkgdir/usr/share/emerald/themes/Greybird"
  tar zxf Greybird.emerald -C "$pkgdir/usr/share/emerald/themes/Greybird/"

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Greybird{,-compact/xfwm4}

  # install compact theme
  install -m 644 xfwm4_compact/* "$pkgdir/usr/share/themes/Greybird-compact/xfwm4/"

  # clean up
  rm -rf {.git,.gitignore,Greybird.emerald,LICENSE.{CC,GPL},README,xfwm4_compact}

  # install theme
  cp -r . "$pkgdir/usr/share/themes/Greybird/"
}
