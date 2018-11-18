# Contributor: judd <jvinet@zeroflux.org>
# Contributor: GabMus <emaildigabry@gmail.com>

_pkgbase=alsa-lib
pkgname=alsa-lib-audacity-pulseaudio-fix
pkgver=1.1.7
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support (with this patch: https://github.com/alsa-project/alsa-lib/commit/b420056604f06117c967b65d43d01536c5ffcbc9 to fix audacity not being able to acquire audio from pulseaudio)"
arch=('x86_64')
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python2: for python smixer plugin')
makedepends=('python2')
provides=('alsa-lib=1.1.7')
conflicts=('alsa-lib' 'alsa-lib-git')
license=('LGPL')
source=(ftp://ftp.alsa-project.org/pub/lib/${_pkgbase}-${pkgver}.tar.bz2 https://github.com/alsa-project/alsa-lib/commit/b420056604f06117c967b65d43d01536c5ffcbc9.patch)
sha256sums=('9d6000b882a3b2df56300521225d69717be6741b71269e488bb20a20783bdc09' SKIP)

prepare() {
  patch -d $_pkgbase-$pkgver -Np1 < b420056604f06117c967b65d43d01536c5ffcbc9.patch
  
}

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  ./configure --without-debug --prefix=/usr --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" --with-pythonincludes=-I/usr/include/python2.7
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
}
