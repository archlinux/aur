# Maintainer: David Marzal <mundolibre at tutanota dot com>
# Contributor: (XavierCLL) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ksvnupdater
pkgver=2.3.0
pkgrel=1
pkgdesc="Utility oriented to KDE translation teams. You can have various local copies of repository, generating projects for Lokalize, checks and corrections using Pology and more."
arch=('x86_64' 'i686')
url="http://www.eloihr.net/ksvnupdater"
license=('GPL')
depends=('kfilemetadata' 'kio' 'knotifications' 'kitemviews' 'kiconthemes' 'karchive' 'qt5-base' 'subversion')
makedepends=('extra-cmake-modules' 'kdoctools')
optdepends=('git: download Scripty and Pology binaries'
            'lokalize: file translations'
            'kdiff3: conflict merge'
            'gettext: msginit to initialize empty translations'
            'openssh: ssh-agent and ssh-add. Accesing KDE repos with auth'
            'jq: creating DocBook documentation'
            'pology: translations checks. Broken due to dependencies'
            'python2-pyenchant: spell checking functionality (needs a dictionary)')
source=(https://www.eloihr.net/ksvnupdater/files/ksvnupdater-$pkgver.tar.bz2)
md5sums=('6e88c47f49165c13ab4f3e925db4b296')
sha1sums=('7cf1bf02ac5e49d582902ff50f86d559261776ce')

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
