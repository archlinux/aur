# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Samuel Walladge <samuel@swalladge.id.au>

pkgname=toggldesktop-beta-bin
_pkgname=toggldesktop
pkgver=7.4.184
pkgrel=1
pkgdesc="Time Tracking Software."
arch=('x86_64')
provides=('toggldesktop')
conflicts=('toggldesktop')

depends=('libxss'
	 'openssl'
	 'qt5-base'
	 'qt5-declarative'
	 'qt5-location'
	 'qt5-sensors'
	 'qt5-svg'
	 'qt5-webchannel'
	 'qt5-webkit'
	 'qt5-x11extras')
url='https://toggl.com/'
source=('removelibs.list'
	'toggldesktop.deb::https://toggl.com/api/v8/installer?app=td&platform=deb64&channel=beta'
	'toggldesktop.bin')

sha512sums=('b49eb411ba0e10e52bc18237e313910ad94e471ba5affb833f33a3e242e7fc44f404fa463c1f8bf7157161338b0be4ced4f14c10259e58e1addcb419d0e3cc1c'
            '81b8fa168fa52a3e2d58c2cd9c2911b6ecdd5bc482bed66016e9c0d25e967df94719c4110f6c0b801c36c4633d1ed45168b16a108aeb3da13e7e1a1a61291b9b'
            'b8669361b7c0cdbaec8a2225085aac9e26c2e99122b0840543685d06bf2fa7410722276ce1fa26374a313e5af6de47f70d84fac8261a35745953b85adb1ce0bb')

prepare() {
  tar -xf data.tar.xz
  for lib in `cat removelibs.list`; do
    rm -rf $srcdir/opt/toggldesktop/lib/$lib
  done
}

package() {
  cp -a $srcdir/opt/ $srcdir/usr/ $pkgdir
  install -D -m 0755 toggldesktop.bin $pkgdir/usr/bin/toggldesktop
}
