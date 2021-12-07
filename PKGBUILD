# Maintainer: David Marzal <mundolibre at tutanota dot com>
# Maintainer: (XavierCLL) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ksvnupdater
pkgver=2.2.0
pkgrel=1
pkgdesc="Utility oriented to KDE translation teams. Through it you can have various local copies of repository, generating projects for Lokalize, checks and corrections using Pology and more."
arch=('i686' 'x86_64')
url="http://www.eloihr.net/ksvnupdater"
license=('GPL')
depends=('kfilemetadata' 'kio' 'knotifications' 'kitemviews' 'kiconthemes' 'karchive' 'qt5-base' 'subversion')
makedepends=('extra-cmake-modules' 'kdoctools')
optdepends=('git: Download Scripty and Pology'
            'lokalize: File translations.'
            'pology: Translations checks. Broken due to dependencies'
            'kdiff3: Conflict merge'
            'gettext: msginit. GNU internationalization library'
            'openssh: ssh-agent and ssh-add. Accesing KDE repos with auth'
            'jq: Creating documentation')
source=(https://www.eloihr.net/ksvnupdater/files/ksvnupdater-$pkgver.tar.bz2)
md5sums=('72d4cd1d03e6373c577147b3d48ac996')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make clean 
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
 
