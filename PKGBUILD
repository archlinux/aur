# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
_pkgname=mpdris
pkgname=${_pkgname}-git
pkgver=r31.304f83b
pkgrel=1
pkgdesc="An implementation of the XMMS2 media player interface MPRIS as a client for MPD"
arch=('i686' 'x86_64')
url="http://ayeon.org/projects/mpDris/"
license=('GPL')
depends=('python2-dbus' 'python2-gobject2' 'python2-mpd2')
optdepends=('mpd: the Music Player Daemon')
makedepends=('git')
conflicts=("mpdris" "mpdris-svn")
backup=(etc/mpDris.conf)
# yes, mpris, not mpDris
source=("mpris::git://ayeon.org/mpris.git")

pkgver() {
  cd "$srcdir/mpris"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/mpris/mpDris"
  sed -i "1s/python$/&2/" mpDris setup.py list_names.py
  sed -i "s/password.*/password =/" $srcdir/mpris/mpDris/mpDris.conf
}

package() {
  cd "$srcdir/mpris/mpDris"
  python2 setup.py install --root=$pkgdir
  install -m 0644 -D $srcdir/mpris/mpDris/mpDris.conf $pkgdir/etc/mpDris.conf
}

md5sums=('SKIP')
