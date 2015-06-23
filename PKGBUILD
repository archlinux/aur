# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>
_pkgname=radiotray
pkgname=${_pkgname}-hg
pkgver=495
pkgrel=1
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="http://radiotray.wordpress.com/"
license=(GPL)
depends=('gstreamer0.10-base-plugins' 'gstreamer0.10-python' 'pygtk' \
'python2-notify' 'python2-xdg' 'python2-dbus' 'gstreamer0.10-good-plugins' \
'python2-gobject' 'python2-lxml')
optdepends=('gstreamer0.10-bad-plugins' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-ffmpeg')
source=('radiotray::hg+https://bitbucket.org/carlmig/radio-tray#revision=40d9969'
	encoding.patch)
makedepends=('mercurial')
provides=(radiotray)
conflicts=('radiotray' 'radiotray-svn')

#rev=1717a0e
rev=a071fa7

pkgver() {
  cd "$srcdir/${_pkgname}"
  #echo $(hg identify -n).$(hg identify -i)
  # In mercurial, you cannot assure that id -n is equal in two copies
  # of the same repository!!!!! So let's try this and hope for the best.
#  echo $(hg id -n).$(hg id -i)
  echo $(hg id -n)
}


build() {
	cd $srcdir/${_pkgname}/src
	patch -p4 < $srcdir/encoding.patch
}

package() {

	cd $srcdir/${_pkgname}
	python2 setup.py install --root=$pkgdir/ --optimize=1

	chmod +x $pkgdir/usr/bin/radiotray
	find $pkgdir -perm 600 -exec chmod 644 {} \;
}

md5sums=('SKIP'
	'4c6862df37e0fcb304d9f0b801f85332')
