#Maintainer: YamashitaRen <lemaitre dot lotus at yahoo dot fr>
# Contributor: freedcpp at seznam dot cz

pkgname=bmdc-git
_pkgname=bmdc
pkgver=r946.f249c13b
pkgrel=1
pkgdesc="DC + + client based on the source code FreeDC + + with Ignore Users."
arch=('i686' 'x86_64')
url="http://launchpad.net/bmdc++"
license=('GPL')
depends=('bzip2' 'gtk3>=3.6' 'libnotify' 'openssl' 'libtar' 'libcanberra' 'gettext' )
makedepends=('pkgconfig' 'git' 'scons' 'gcc')
provides=('bmdc')
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n' 'freedcpp')
source=("git+https://github.com/bmdcpp/bmdc.git")
install=$pkgname.install
md5sums=("SKIP")
#	 "66eb7932fc2076ce8337235a24375e81")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    scons PREFIX=/usr/ LIBDIR=/usr/share release=1 libxattr=0 newSettings=1 libappindicator=0 useStatusIcon=1 -j$(nproc)
}

package() {
    cd "$srcdir/$_pkgname"
    scons PREFIX=/usr/ LIBDIR=/usr/share install FAKE_ROOT=$pkgdir/
}
