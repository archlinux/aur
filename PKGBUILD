# Contributor: grimi <grimi at poczta dot fm>

_pkgname=omnibook-git
pkgname=omnibook-dkms-git
pkgver=20150227
pkgrel=2
pkgdesc="Kernel module for HP OmniBook,Pavilion,Toshiba and Compal ACL00 laptops"
arch=('any')
url="http://omnibook.sourceforge.net"
license=('GPL')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build for Arch kernel'
            'linux-lts-headers: build LTS kernel'
            'linux-zen-headers: build ZEN kernel')
conflicts=('omnibook-git')
provides=('omnibook-git')
source=("$_pkgname::git://devoid-pointer.net/omnibook.git"
        "dkms.conf" "makefile.patch")
md5sums=('SKIP'
         '8e2713c9bd733157d140f2e2bd3dc316'
         '7d2830930ad14b1125b219b18acb37c0')


pkgver() {
   cd $_pkgname
   git log -1 --format="%cd" --date="short"|sed 's|-||g'
}

build() {
   cd $_pkgname
   install -m644 ../dkms.conf ./
   patch -Np0 -i ../makefile.patch
}

package() {
   install -d "$pkgdir"/usr/src
   rm -rf $_pkgname/.git
   cp -r --no-preserve="mode,ownership" $_pkgname "$pkgdir"/usr/src/
}


