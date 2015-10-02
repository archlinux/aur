_pkgname=Nagstamon
pkgname=nagstamon
pkgver=1.0.1
pkgrel=4
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
        "python279-self-signed-cert.patch"
)
md5sums=(
        '1c15e1558c3c0e02644920698c18c4d5'
        '3c84cd947db8c00ef978a15e94307f39'
        'cc6eb1d2463415930a30b1337ae448f0'
        '0681f614848a96c020720cc3924ed313'
        '72d2ef25565201c7ffc5c9714dcb5398'
)
sha256sums=(
        'e60a2b1fef842deb8377ace02df6791f3dcc5683d9dae4323de3f5f1f8a9893b'
        '8c9cdc95c857111e02627ab4371ea628c606c9750be566095e0ddddc8dbc3843'
        'ccf631a32ae286c364fe6628e4f635f1b14d0df96ee3f2c1940972a5ace7506d'
        'dc303b0bc0a543f3e845772ad633c381c39eead1908a6be9229904b7b4759062'
        '466622be84ed8a41737911c6427eb642fcbc559da50d4ea8189fec023b7c9a7d'
)

package() {
  cd "$srcdir/$_pkgname"

  patch -Np0 -i "$srcdir/nagstamon-noti.patch"
  patch -Np0 --verbose -i "$srcdir/xdg-directories.patch"
  patch -Np2 -i "$srcdir/python279-self-signed-cert.patch"

  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -Dm644 "$srcdir/nagstamon.desktop" "$pkgdir/usr/share/applications/nagstamon.desktop"

  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

