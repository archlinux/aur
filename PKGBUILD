# Contributor: Guillaume Benoit <guillaume@manjaro.org>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pyalpm-manjaro
pkgver=0.6.2.2
pyalpmver=0.6.2
pkgrel=3
pkgdesc="Manjaro patching Libalpm bindings for Python 3"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.4' 'pacman>=4.1')
replaces=('pyalpm')
provides=('pyalpm=0.6.2')
conflicts=('pyalpm')
makedepends=('git' 'patch')
source=("ftp://ftp.archlinux.org/other/pyalpm/pyalpm-${pyalpmver}.tar.gz"
        'custom.patch')
sha256sums=('42ac78baf8221c04fc9a0cb29dd8e4fb425d054292fd9206a2eb7fc21e0564a0'
            '06c3f35b214c33dd7a16f0b150183f3debedd39d8c20afc349de89aeabdaae0c')

build() {
  cd ${srcdir}/pyalpm-${pyalpmver}

  # apply custom patch
  patch -Np1 -i "${srcdir}/custom.patch"
  
  # workaround Python packaging issue (FS#34658)
  export CFLAGS="$CFLAGS -Wno-format"

  python setup.py build
}

package() {
  cd ${srcdir}/pyalpm-${pyalpmver}
  python setup.py install --root=${pkgdir}
}
