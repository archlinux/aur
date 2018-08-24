# $Id: PKGBUILD 210977 2017-02-07 23:59:02Z bgyorgy $
# Maintainer: Angel Velasquez <angvp@archlinux.org>  
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: helq <linuxero789@gmail.com>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: DobleD <dobled@dobled.info>

pkgname=ninja-ide
pkgver=2.3
pkgrel=4
pkgdesc="Cross-platform IDE focused on Python application development"
arch=('any')
url="http://ninja-ide.org/"
license=('GPL3')
depends=('python2-setuptools' 'python2-pyqt' 'python2-pyinotify')
source=($pkgname-$pkgver.zip::https://github.com/ninja-ide/ninja-ide/archive/v$pkgver.zip
        ninja-ide.desktop
        remove-qtwebkit.patch)
sha256sums=('463a801040afca7fae12c8d9935e907dc99d744544b42808ce59737b5609e975'
            '6cabe8ba0c1589feb4919f9de6e4b8bc0a692f5cb8c630f1e9c661aa19f22fdb'
            'ba0d32eb194bcdfebf96e2f8a276c19f8aeadd28961fc135504d8715db5ee52c')

prepare() {
  cd $pkgname-$pkgver

  # Remove qtwebkit dependency
  patch -Np1 -i ../remove-qtwebkit.patch
}

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" -O1

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ninja_ide/img/icon.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
