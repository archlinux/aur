# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Alexandru Ianu <alexandru . ianu @ gmail . com>
# Submiter to AUR: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=vertex-maia-icon-theme
pkgver=20160421
pkgrel=1
_pkgbase=menda-icon-themes
_commit='19d251bce23ba64f30333dcddffb719bc813c504'
arch=('any')
url="https://github.com/manjaro/menda-icon-themes"
license=('GPL')
depends=('hicolor-icon-theme' 'librsvg')
options=('!emptydirs' '!strip')
source=("$_pkgbase-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
md5sums=('e5ddd179c6b46af66b305c54fb4c3dc0')

package() {
  pkgdesc="Icons matching Vertex Maia themes, based on Menda Circle"
  optdepends=('vertex-maia-themes: Official Manjaro Gtk2/3, Metacity, Xfwm, Cinnamon and GNOME Shell themes')

  install -dm755 "${pkgdir}/usr/share/icons"

  cd "$pkgdir/usr/share/icons"
  cp -r "$srcdir/$_pkgbase-$_commit/Menda-Circle" Vertex-Maia
  find . -type d -exec chmod 755 '{}' \;
  find . -type f -exec chmod 644 '{}' \;

  msg "Adjusting icon colours..."
  find . ! -type l -name "*.svg" -exec sed -i "s/27ae60/16a085/g" '{}' \;
  msg "Revert some colour changes..."
  sed -i "s/16a085/27ae60/g" */apps/48x48/apps/chrome-fgbjpbdfegnodokpoejnbhnblcojccal-Default.svg.svg
  sed -i "s/16a085/27ae60/g" */apps/scalable/chrome-fgbjpbdfegnodokpoejnbhnblcojccal-Default.svg.svg
  msg "Adjust some more colours..."
  find */places/. ! -type l -name "*.svg" -exec sed -i "s/27ff60/278a49/g" '{}' \;
  find */places/. ! -type l -name "*.svg" -exec sed -i "s/278a49/3e7b6f/g" '{}' \;

  find . -name "index.*" -exec sed -i "s/Menda-Circle/Vertex-Maia/g;s/ Circle Edition//g" '{}' \;
}
