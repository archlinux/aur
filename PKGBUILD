# Maintainer: marazmista <marazmista@gmail.com>

pkgname=radeon-profile-daemon-git
pkgbase=radeon-profile-daemon
pkgver=20161003.r0.gda49107
pkgrel=2
pkgdesc="System daemon for radeon-profile"
url="http://github.com/marazmista/radeon-profile-daemon"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-base' 'radeon-profile')
optdepends=('xf86-video-ati: radeon driver'
	    'xf86-video-amdgpu: amdgpu driver')
provides=('radeon-profile-daemon')
replaces=('radeon-profile-daemon')
source=('git+https://github.com/marazmista/radeon-profile-daemon.git')
sha256sums=('SKIP')
  
pkgver() {
cd "$srcdir/$pkgbase"
git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
mkdir -p build
cd build
qmake-qt5 "../radeon-profile-daemon/radeon-profile-daemon/"
make
}
 
package() {
cd build
make prefix="${pkgdir}" install

install -Dm644 "$srcdir/build/radeon-profile-daemon" "$pkgdir/usr/bin/radeon-profile-daemon"
chmod +x "$pkgdir/usr/bin/radeon-profile-daemon"

install -Dm644 "$srcdir/radeon-profile-daemon/radeon-profile-daemon/extra/radeon-profile-daemon.service" "$pkgdir/etc/systemd/system/radeon-profile-daemon.service"
}