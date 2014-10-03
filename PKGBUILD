# GnuPG2 GIT version
# Maintainer: alphazo@gmail.com
# Based on official package maintained by Tobias Powalowski <tpowa@archlinux.org>
# Cleanup from @holos

_gitname=gnupg
pkgname=gnupg-git
pkgver=2.1.0+beta834+21+g688a903
pkgrel=1
pkgdesc="GNU Privacy Guard 2 - a PGP replacement tool. Development version. Do not use in production environments. Test new ECC algorithms by using \"gpg --full-gen-key --expert\""
arch=('i686' 'x86_64')
depends=('libldap' 'curl' 'bzip2' 'zlib' 'libksba>=1.2' 'libgpg-error-git' 'libgcrypt-git'
         'pth' 'libusb-compat' 'libassuan-git' 'npth-git' 'texinfo' 'readline' 'pinentry')
license=('GPL')
url="http://www.gnupg.org/"
makedepends=('git' 'ghostscript' 'transfig' 'automake-1.11')
provides=("gnupg=${pkgver}" 'dirmngr')
conflicts=('gnupg2' 'gnupg' 'dirmngr')
install=${pkgname}.install
source=("git://git.gnupg.org/gnupg.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --tags | sed 's/gnupg-//;s/-/+/g'
}

build() {
  cd "$_gitname"

  AUTOMAKE_SUFFIX="-1.11" ./autogen.sh --force

  ./configure \
    --enable-maintainer-mode \
    --prefix=/usr \
    --libexecdir=/usr/lib/gnupg

  make
}

package() {
  cd "$_gitname"

  make DESTDIR=${pkgdir} install
  ln -s gpg2 "$pkgdir/usr/bin/gpg"
}

# vim: ft=sh syn=sh et sw=2
