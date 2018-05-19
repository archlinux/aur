# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

_pkgname=nemo-seahorse
pkgname="${_pkgname}-nonautilus"
pkgver=3.8.0
pkgrel=1
pkgdesc="An extension for Nemo which allows encryption and decryption of OpenPGP files using GnuPG. (without nautilus dependency)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
depends=('libcryptui' 'nemo>=3.8' 'gcr>=3.4.0' 'gpgme>=1.2.0' )
makedepends=('intltool' 'gnupg' 'gnome-common' 'gnome-keyring')
groups=('nemo-extensions')
conflicts=('nemo-seahorse' 'seahorse-nautilus' 'nemo-seahorse-git')
optdepends=('seahorse: For seahorse support')
provides=('nemo-seahorse')
options=('!libtool' '!emptydirs')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
md5sums=('3b8df9f23de294ae0bc7c3b394c7c1da')


prepare() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
#  cd "${srcdir}/nemo-extensions/${_pkgname}"

  # Python2 fix
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  sed -i "s/1.2 1.4 2.0 2.1/1.2 1.4 2.0 2.1 2.2/" configure.ac
}

build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
#  cd "${srcdir}/nemo-extensions/${_pkgname}"

  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir="/usr/lib/${_pkgname}" \
    --disable-static
  make
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${_pkgname}"
#  cd "${srcdir}/nemo-extensions/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
