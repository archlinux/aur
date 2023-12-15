# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=libsepol
pkgver=3.6
pkgrel=1
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('LGPL2.1')
groups=('selinux')
makedepends=('flex')
depends=('glibc')
options=(staticlibs)
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  'B8682847764DF60DF52D992CBC3905F235179CF1'  # Petr Lautrbach <plautrba@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('c9dc585ea94903d784d597c861cd5dce6459168f95e22b31a0eab1cdd800975a'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  export CFLAGS="${CFLAGS} -fno-semantic-interposition"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" SHLIBDIR=/usr/lib install
}
