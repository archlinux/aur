# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>

pkgname=firefox-extension-kwallet
pkgver=2.4
pkgrel=1
pkgdesc="An extension to allows Firefox to use KDE's Kwallet to store passwords"
arch=('i686' 'x86_64')
url="https://addons.mozilla.org/firefox/addon/kde-wallet-password-integratio/"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')
depends=('qt4' 'kdelibs' 'firefox' 'kdeutils-kwalletmanager')
source=('https://addons.mozilla.org/firefox/downloads/latest/49357/platform:2/addon-49357-latest.xpi')
md5sums=('2b486b4a1c781d8bf7cab0c2ae729e78')

package() {
  # Variables
  emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid

  # Install
  sed -i "s|<em:maxVersion>.*</em:maxVersion>|<em:maxVersion>99.*</em:maxVersion>|" install.rdf
  install -dm755 "$dstdir"
  rm *.xpi
  cp -r * "$dstdir/"
}