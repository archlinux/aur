# Maintainer: David Marzal <mundolibre at tutanota dot com>
# Maintainer: (XavierCLL) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ksvnupdater
pkgver=2.2.3
pkgrel=2
pkgdesc="Utility oriented to KDE translation teams. You can have various local copies of repository, generating projects for Lokalize, checks and corrections using Pology and more."
arch=('i686' 'x86_64')
url="http://www.eloihr.net/ksvnupdater"
license=('GPL')
depends=('kfilemetadata' 'kio' 'knotifications' 'kitemviews' 'kiconthemes' 'karchive' 'qt5-base' 'subversion')
makedepends=('extra-cmake-modules' 'kdoctools')
optdepends=('git: download Scripty and Pology binaries'
  'lokalize: file translations.'
  'kdiff3: conflict merge'
  'gettext: msginit. GNU internationalization library'
  'openssh: ssh-agent and ssh-add. Accesing KDE repos with auth'
  'jq: creating documentation'
  'pology: translations checks. Broken due to dependencies'
  'python2-pyenchant: spell checking functionality (needs a dictionary)')
source=(https://www.eloihr.net/ksvnupdater/files/ksvnupdater-$pkgver.tar.bz2)
md5sums=('37e5070f1a3340921d060e23d7f0c6ca')

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
