# Maintainer: Robin Nehls <aur@manol.is>

pkgname=swtpm-git
pkgver=c9de5f0
pkgrel=1
pkgdesc="Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface."
arch=('i686' 'x86_64')
url="https://github.com/stefanberger/swtpm"
license=('BSD')
depends=('openssl' 'zlib' 'libtpms' 'tpm-tools' 'pcre' 'libtasn1' 'gnutls' 'p11-kit' 'nettle' 'libffi' 'fuse' 'glib2')
makedepends=('automake' 'autoconf' 'bash' 'coreutils' 'expect' 'sed')
provides=('swtpm')
source=('git+https://github.com/stefanberger/swtpm.git')
sha1sums=('SKIP')
_gitname=swtpm

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  ./bootstrap.sh
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
