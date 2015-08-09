_pkgname=Nagstamon
pkgname=nagstamon
pkgver=1.0.1
pkgrel=3
pkgdesc="Nagios status monitor for the desktop"
depends=('python2' 'pygtk' 'gnome-python-extras' 'python2-lxml' 'python2-rsvg' 'python2-distribute' 'python2-xdg')
arch=('any')
url="http://nagstamon.ifw-dresden.de/"
license=('GPL')
source=(
        "https://nagstamon.ifw-dresden.de/files-nagstamon/stable/$_pkgname-$pkgver.tar.gz"
        "nagstamon.desktop"
        "nagstamon-noti.patch"
        "xdg-directories.patch"
)
md5sums=(
        '1c15e1558c3c0e02644920698c18c4d5'
        '484a012b99f483dc293251e329ba760d'
        'cc6eb1d2463415930a30b1337ae448f0'
        '0681f614848a96c020720cc3924ed313'
)
sha256sums=(
        'e60a2b1fef842deb8377ace02df6791f3dcc5683d9dae4323de3f5f1f8a9893b'
        '8b88e472099cb7593a09e0e251095cad841acce424bcb43ca4280d9c71395917'
        'ccf631a32ae286c364fe6628e4f635f1b14d0df96ee3f2c1940972a5ace7506d'
        'dc303b0bc0a543f3e845772ad633c381c39eead1908a6be9229904b7b4759062'
)

package() {
  cd "$srcdir/$_pkgname"

  patch -Np0 -i "$srcdir/nagstamon-noti.patch"
  patch -Np0 --verbose -i "$srcdir/xdg-directories.patch"

  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -Dm644 "$srcdir/nagstamon.desktop" "$pkgdir/usr/share/applications/nagstamon.desktop"
  install -Dm644 "$srcdir/nagstamon.desktop" "$pkgdir/etc/xdg/autostart/nagstamon.desktop"

  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

