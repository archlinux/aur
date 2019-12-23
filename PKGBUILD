# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=sonata
pkgver=1.6.2.1
pkgrel=14
pkgdesc="Elegant GTK+ music client for MPD"
arch=('x86_64')
url="https://sourceforge.net/projects/sonata.berlios"
license=('GPL3')
depends=('pygtk' 'python2-mpd')
optdepends=('python2-tagpy: Metadata editing support'
            'python2-dbus: Various extra functionality (e.g. multimedia keys support)')
provides=('python2-mmkeys')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}.berlios/${pkgname}-$pkgver.tar.gz"
        mpd-0.18.patch
        info.py.patch)
md5sums=('0b912325e7175abad3bf6c0edc071e05'
         '9bc61f5015f415dc16ceb84a95c99f5e'
         '595fcf7615035829b264afecb5a1beeb')

build() {
  cd ${pkgname}-$pkgver
  patch -Np1 -i "$srcdir/mpd-0.18.patch"
  patch -Np0 -i "$srcdir/info.py.patch"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' sonata/breadcrumbs.py
}

package() {
  cd ${pkgname}-$pkgver
  python2 setup.py install --prefix=/usr --optimize=1 --root="$pkgdir"
}
