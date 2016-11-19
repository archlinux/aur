# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-winswitch-svn
pkgver=14464
pkgrel=1
pkgdesc="Modified version of xpra by Winswitch"
arch=('i686' 'x86_64')
url="http://xpra.org/"
license=('GPL2')
depends=('python2' 'pygtk' 'libxtst' 'python2-imaging' 'python2-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libwebp' 'rencode')
optdepends=('x264: Codec')
makedepends=('subversion' 'python2-setuptools' 'cython2')
provides=('parti-all' 'xpra-winswitch')
conflicts=('parti-all')
backup=('etc/xpra/xpra.conf' 'etc/xpra/xorg.conf')
install=xpra-winswitch.install
source=("xpra::svn+https://www.xpra.org/svn/Xpra/trunk/src"
        "xpra-winswitch.install")

md5sums=('SKIP'
        'f3bdf0f695617ba4e26af55af263ba82')

_svnmod=xpra
pkgver() {
      LC_ALL=C svn info "$SRCDEST/$_svnmod" | awk '/Last Changed Rev/ {print $4}'
}

build() {
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  #python2 setup.py build || return 1  
  CFLAGS="$CFLAGS -fno-strict-aliasing" python2 setup.py build || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root=${pkgdir} || return 1
}

# vim:set ts=2 sw=2 et:
