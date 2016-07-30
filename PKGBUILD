# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Ner0
# Contributor: Sauyon Lee <sauyonl@sauyon.com>

pkgname=gtk-theme-flatstudio
pkgver=1.03
pkgrel=2
pkgdesc="Flat, simple and clean GTK3 theme"
arch=('any')
url="http://gnome-look.org/content/show.php?content=154296"
license=('GPL3')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
options=('!strip')
source=("https://dl.opendesktop.org/api/files/download/id/1460761605/154296-FlatStudio-1.03.tar.gz")
md5sums=('4a22cba22de2086b108bf8119473453f')

prepare() {
  # fix for gtk 3.11.2+
  echo -e '\nGtkBox { background-color: transparent; }' | \
  tee -a FlatStudio{,Dark,Gray,Light}/gtk-3.0/gtk.css > /dev/null
}

package() {
  install -dm755 "$pkgdir/usr/share/themes/"
  install -Dm644 FlatStudio/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf FlatStudio/{LICENSE,*.txt,*.tar.gz}

  cp -rf FlatStudio{,Dark,Gray,Light} "$pkgdir/usr/share/themes/"

  find "$pkgdir/" -type d -exec chmod 755 "{}" \;
  find "$pkgdir/" -type f -exec chmod 644 "{}" \;
}
