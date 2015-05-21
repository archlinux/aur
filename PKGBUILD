pkgname=qweechat
pkgver=1.1_rc2
pkgrel=1
arch=('any')
pkgdesc="QT GUI for WeeChat"
url="http://weechat.org"
license=('GPL')
depends=('python2' 'python2-pyqt' 'python2-sip' 'python2-setuptools' 'python2-xdg')
source=('http://weechat.org/files/src/qweechat-devel.tar.bz2'
        'qweechat.desktop'
        'xdg-directories.patch')
md5sums=('d56d7f12720c5fe2571590940b5ac01a'
         'df3ad9d12c1d71199e21ec7136ea6cc5'
         'd5813c226362e7f3b41a0eaf3041570e')

prepare() {
  cd "$pkgname"-devel
  patch -Np1 -i "$srcdir/xdg-directories.patch"
}

build() {
  cd "$pkgname"-devel
  python2 setup.py build
}

package() {
  cd "$pkgname"-devel
  python2 setup.py install --root="$pkgdir" -O2
  install -m 644 -D "$srcdir/qweechat.desktop" "$pkgdir/usr/share/applications/qweechat.desktop"
  install -m 644 -D "$srcdir/$pkgname-devel/qweechat/data/icons/weechat_icon_32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/qweechat.png"
}
