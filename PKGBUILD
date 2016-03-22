# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsepol
pkgver=2.5
pkgrel=2
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64' 'armv6h')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('flex')
depends=('glibc')
options=(staticlibs)
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223/${pkgname}-${pkgver}.tar.gz"
        '0001-libsepol-cil-fix-bug-when-resetting-class-permission.patch')
sha256sums=('2bdeec56d0a08b082b93b40703b4b3329cc5562152f7254d8f6ef6b56afe850a'
            '5928a0feee0495d830b612175a6c57f7fc867306f04d022ba816bdee4606cfea')

prepare() {
  cd "${pkgname}-${pkgver}"

  # https://github.com/SELinuxProject/selinux/commit/4df9f89cb1182f0dd324e271109efd7e2eda467b
  patch -Np2 -i '../0001-libsepol-cil-fix-bug-when-resetting-class-permission.patch'
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}"/usr/lib SHLIBDIR="${pkgdir}"/usr/lib install
}
