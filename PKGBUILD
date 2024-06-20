# Maintainer: David Marzal <mundolibre at tutanota dot com>
# Contributor: (XavierCLL) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=ksvnupdater
pkgver=3.0.0
pkgrel=1
pkgdesc="Utility oriented to KDE translation teams. You can have various local repository copies, generate projects for Lokalize, checks and corrections using Pology and more."
arch=('x86_64' 'i686')
url="http://www.eloihr.net/ksvnupdater"
license=('GPL-2.0-or-later')
depends=('ktextwidgets' 'kfilemetadata' 'kio' 'knotifications' 'kitemviews' 'kiconthemes' 'karchive' 'qt6-base' 'subversion')
makedepends=('extra-cmake-modules' 'kdoctools')
optdepends=('git: download Scripty and Pology binaries'
            'lokalize: file translations'
            'kdiff3: conflict merge'
            'gettext: msginit to initialize empty translations'
            'openssh: ssh-agent and ssh-add. Accessing KDE repos with auth'
            'jq: creating DocBook documentation'
            'pology-git: translations checks. Download also available in ksvnupdater'
            'python-pyenchant: spell checking functionality (needs a dictionary)'
            'poxml: creating documentation'
            'hashdeep: downloading documentation files')
source=(https://www.eloihr.net/ksvnupdater/files/ksvnupdater-$pkgver.tar.bz2)
md5sums=('69b91bea8b920746ac41ef3dfd7cd1f3')
sha1sums=('6fd755daff9d5da053f0e59d6491daad65b86010')

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
