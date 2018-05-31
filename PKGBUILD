# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra
pkgver=2.3.1
pkgrel=1
pkgdesc="multi-platform screen and application forwarding system screen for X11"
arch=('x86_64')
url='https://www.xpra.org'
license=('GPL2')
depends=('python2' 'pygtk' 'libxtst' 'python2-pillow' 'python2-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libxkbfile'
         'python2-numpy' 'python2-rencode' 'python2-opengl'
         'python2-gtkglext' 'python-lz4' 'python-opengl')
optdepends=('x264: Codec' 'python2-dbus: dbus features'
            'python2-pycups: Printing support' 'python2-netifaces: mdns'
            'python2-cryptography: Cryptography'
            'python-cryptography: Cryptography'
            'gst-python2: Sound Forwarding'
            'pam-selinux: Proxy Server Support'
            'opencv: Webcam')
makedepends=('python2-setuptools' 'cython2' 'uglify-js')
backup=('etc/xpra/xpra.conf' 'etc/xpra/xorg.conf'
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
        'etc/xpra/conf.d/65_proxy.conf'
        'etc/pam.d/xpra')
source=($pkgname-$pkgver.tar.xz::$url/src/$pkgname-$pkgver.tar.xz
        $pkgname-$pkgver.tar.xz.asc::$url/src/$pkgname-$pkgver.tar.xz.gpg)
md5sums=('f95844aae43fd33878b60d80da360d5c'
         '0654bd60e18dfa99cdc22b71b3dd38b4')
sha1sums=('5bcd554bff69a4077b7090f6871e939b5b3b47b2'
          '04ea2e3b6e4328135c2aed7baf0329a79750d35b')
sha256sums=('3e0fea421f8ad30daecd496e8c0cf31e6993ad3f3f17f69481f39ec37395f071'
            '41e06e1325fb999affa4d6e5bee4604ef732700d7c10896cb81711123f94fe2f')
validpgpkeys=('C11C0A4DF702EDF6C04F458C18ADB31CF18AD6BB') # Antoine Martin <antoine@nagafix.co.uk>

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  #CFLAGS="$CFLAGS -fno-strict-aliasing"
  export pkgdir
  CFLAGS="$CFLAGS -fno-strict-aliasing" python2 setup.py build --without-enc_x265
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}" --without-enc_x265 --optimize=1
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}/lib"
}
