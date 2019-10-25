# Maintainer: Whezzel <whezzel at gmail dot com>
# Contributor: Karel Louwagie <karel at louwagie dot net>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Yurii Kolesnykov <root at yurikoles dot com>

pkgname=toggldesktop-bin
_pkgname=toggldesktop
pkgver=7.4.528
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
	"toggldesktop.deb::https://github.com/toggl/toggldesktop/releases/download/v${pkgver}/toggldesktop_${pkgver}_amd64.deb"
	'toggldesktop.bin')

sha512sums=('b49eb411ba0e10e52bc18237e313910ad94e471ba5affb833f33a3e242e7fc44f404fa463c1f8bf7157161338b0be4ced4f14c10259e58e1addcb419d0e3cc1c'
            'd15b3801cd7eae8af245b2b57f42d510fe4b0e0a8e9c3f7a2e67fc253e3bbc04c86a56e955e0addb398447d4f08035f1cdfbf239849341a8ce7bae1ed368ebef'
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
