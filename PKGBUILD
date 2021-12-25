# Maintainer: Bernhard Nornes Lotsberg <bernhard.lotsberg@bouvet.no>
# Contributor: lyoko, Tom Nguyen

pkgname=networkmanager-ssh
pkgver=1.2.12
pkgrel=1
pkgdesc="SSH VPN support for NetworkManager"
arch=('any')
url="https://github.com/danfruehauf/NetworkManager-ssh"
license=('GPL2')
depends=('networkmanager'
	 'libnm'
	 'nm-connection-editor')
optdepends=()
options=()
makedepends=('git' 'make' 'gcc' 'autoconf' 'intltool')
provides=('networkmanager-ssh')

source=($pkgname::"git://github.com/danfruehauf/NetworkManager-ssh.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  if [ ! -f configure ]; then
    autoreconf -fvi
  fi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-static \
    --disable-dependency-tracking \
    --enable-more-warnings=no

  make ${MAKEFLAGS}
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" INSTALL="install -p" CP="cp -p" install
}

