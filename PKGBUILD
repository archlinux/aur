# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jerome Barnett <techryda at silentdome dot com>

pkgname=firefox-extension-htitle
pkgver=3.3
pkgrel=1
pkgdesc="Hide Firefox title bar if window is maximized (Useful in GNOME Shell)"
url="https://github.com/seleznev/firefox-extension-htitle"
arch=('any')
license=('MPLv2')
depends=("firefox")
makedepends=('unzip')
source=("https://github.com/seleznev/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.xpi")
md5sums=('6336be974764f5bb65bbdb7f2db32999')

package() {
  local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  #  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>20.*</em:maxVersion>#' install.rdf
  cp -R * $dstdir
  rm $dstdir/*.xpi
}
