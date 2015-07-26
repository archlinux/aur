# Maintainer : Rob McCathie <korrode AT gmail>

_name=compiz
pkgname=compiz-xfce
pkgver=0.8.9
pkgrel=24
arch=('any')
url="http://cgit.compiz.org/"
license=('GPL' 'CCPL:by-sa-3.0')

source=('compiz-xfce-decoratortheme'
        'compiz-xfce-decoratortheme.desktop'
        'compiz-xfce-autostart'
        'compiz-xfce-autostart.desktop'
        "compiz-xfce-uninstall-helper"
        "compiz-xfce-uninstall-helper.desktop"
        "xfce-theme-greybird.tar.gz::https://github.com/shimmerproject/Greybird/archive/v1.2.2.tar.gz")

sha1sums=('da229e2c5d2badab521b6a87137ac44d7e4962a5'
          '9a9b28143e237834e98c82bb677a1cff62dc3af9'
          'b428f171ab8b34b236aed9954867102bdd33f9da'
          'a790b6556695b06af4eff910e7dc409aab85f9a8'
          '4b4fa287ea72f8b8eccdf4254dfe2174d9b41b2a'
          '847d498050e96fbb1a43c29a0f98b70a74319203'
          '57a827b34b58f03e692262a6746b394cb70149dc')

pkgdesc="Compiz meta package for Xfce, including autostart and optimisations"
depends=('compiz-gtk-standalone' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'ccsm' 'xfce4-session')
optdepends=("compiz-fusion-plugins-unsupported: Compiz unsupported plugins")
install="$pkgname".install

package() {
  # Place autostart enablers/scripts
  install -Dm755 "${srcdir}/compiz-xfce-decoratortheme" "${pkgdir}/usr/bin/compiz-xfce-decoratortheme"
  install -Dm644 "${srcdir}/compiz-xfce-decoratortheme.desktop" "${pkgdir}/etc/xdg/autostart/compiz-xfce-decoratortheme.desktop"
  install -Dm755 "${srcdir}/compiz-xfce-autostart" "${pkgdir}/usr/bin/compiz-xfce-autostart"
  install -Dm644 "${srcdir}/compiz-xfce-autostart.desktop" "${pkgdir}/etc/xdg/autostart/compiz-xfce-autostart.desktop"
  install -Dm755 "${srcdir}/compiz-xfce-uninstall-helper" "${pkgdir}/usr/share/compiz-xfce/compiz-xfce-uninstall-helper"
  install -Dm644 "${srcdir}/compiz-xfce-uninstall-helper.desktop" "${pkgdir}/usr/share/compiz-xfce/compiz-xfce-uninstall-helper.desktop"
  
  # greybird window decorations
  cd "$srcdir/Greybird-1.2.2"
  mkdir -p "$pkgdir/usr/share/themes/compiz-xfce-greybird"
  cp LICENSE* "$pkgdir/usr/share/themes/compiz-xfce-greybird"
  cp -r metacity-1/ "$pkgdir/usr/share/themes/compiz-xfce-greybird"
  rm "$pkgdir/usr/share/themes/compiz-xfce-greybird/metacity-1/metacity-theme-3.xml"
  sed -i 's|Greybird|compiz-xfce-greybird|' "$pkgdir/usr/share/themes/compiz-xfce-greybird/metacity-1/metacity-theme-2.xml"
}
