# Maintainer: ThePirate42 <aur at thepirate42.org>
# Contributor: Bernhard Nornes Lotsberg <bernhard.lotsberg at bouvet.no>
# Contributor: lyoko, Tom Nguyen

pkgname=networkmanager-ssh
pkgver=1.4.4
pkgrel=1
pkgdesc="OpenSSH VPN support for NetworkManager"
arch=('x86_64')
url="https://github.com/danfruehauf/NetworkManager-ssh"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libnm' 'libnma' 'libsecret' 'networkmanager' 'openssh' 'sshpass')
makedepends=('git' 'intltool')
optdepends=()

source=(${pkgname}::"git+https://github.com/danfruehauf/NetworkManager-ssh.git#tag=${pkgver}")
md5sums=('7ff409d26bf8e922fcc0d95e8c908944')

prepare() {
  cd "${srcdir}/${pkgname}"
  autoreconf -fvi --include=/usr/share/gettext/m4
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-static \
    --disable-dependency-tracking \
    --enable-more-warnings=no \
    --without-libnm-glib
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" INSTALL="install -p" CP="cp -p" install
}

