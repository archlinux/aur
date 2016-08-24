pkgname=qweechat
pkgver=r94.f5e54d0
pkgrel=1
arch=('any')
pkgdesc="QT GUI for WeeChat"
url="http://weechat.org"
license=('GPL')
depends=('python2' 'python2-pyqt' 'python2-sip' 'python2-setuptools' 'python2-xdg')
source=("$pkgname"::'git+https://github.com/weechat/qweechat.git'
        'qweechat.desktop'
        'xdg-directories.patch')
md5sums=('SKIP'
         'df3ad9d12c1d71199e21ec7136ea6cc5'
         'd5813c226362e7f3b41a0eaf3041570e')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -Np1 -i "$srcdir/xdg-directories.patch"
}

build() {
  cd "$pkgname"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir" -O2
  install -m 644 -D "$srcdir/qweechat.desktop" "$pkgdir/usr/share/applications/qweechat.desktop"
  install -m 644 -D "$srcdir/$pkgname/qweechat/data/icons/weechat.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/qweechat.png"
}
