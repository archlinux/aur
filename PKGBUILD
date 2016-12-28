# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-winswitch-svn
pkgver=14634
pkgrel=1
pkgdesc="Modified version of xpra by Winswitch"
arch=('i686' 'x86_64')
url="http://xpra.org/"
license=('GPL2')
depends=('python2' 'pygtk' 'libxtst' 'python2-pillow' 'python2-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libwebp' 'libxkbfile'
         'python2-numpy' 'rencode' 'python2-opengl'
         'python2-gtkglext' 'python-lz4' 'python-opengl' 'python2-opengl')
optdepends=('x264: Codec' 'python2-dbus: dbus features'
            'python2-pycups: Printing support' 'python2-netifaces: mdns'
            'python2-cryptography: Cryptography'
            'python-cryptography: Cryptography'
            'python2-crypto: Cryptography'
            'python-crypto: Cryptography')
makedepends=('subversion' 'python2-setuptools' 'cython2')
provides=('parti-all' 'xpra-winswitch')
conflicts=('parti-all')
backup=('etc/xpra/xpra.conf' 'etc/xpra/xorg.conf'
        'etc/xpra/cuda.conf' 'etc/xpra/nvenc.keys'
        'etc/xpra/conf.d/05_features.conf'
        'etc/xpra/conf.d/10_network.conf'
        'etc/xpra/conf.d/12_ssl.conf'
        'etc/xpra/conf.d/15_file_transfers.conf'
        'etc/xpra/conf.d/16_printing.conf'
        'etc/xpra/conf.d/20_sound.conf'
        'etc/xpra/conf.d/30_picture.conf'
        'etc/xpra/conf.d/35_webcam.conf'
        'etc/xpra/conf.d/40_client.conf'
        'etc/xpra/conf.d/42_client_keyboard.conf'
        'etc/xpra/conf.d/50_server_network.conf'
        'etc/xpra/conf.d/55_server_x11.conf'
        'etc/xpra/conf.d/60_server.conf'
        'etc/xpra/conf.d/65_proxy.conf')
install=xpra-winswitch.install
source=("xpra::svn+https://www.xpra.org/svn/Xpra/trunk/src"
        "xpra-winswitch.install")

md5sums=('SKIP'
         'df5cfe00b5d1be31f10b206e7b8d7daf')

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
  #python2 setup.py build
  export pkgdir
  CFLAGS="$CFLAGS -fno-strict-aliasing" python2 setup.py build
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
