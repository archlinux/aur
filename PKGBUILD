# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python37-wxpython
_pkgname=wxPython
pkgver=4.0.7
pkgrel=1
pkgdesc='Cross-platform GUI toolkit'
arch=('x86_64')
license=('custom:wxWindows')
url='https://www.wxpython.org'
depends=('wxgtk3' 'python-six')
optdepends=('python-pypubsub: Alternative to the deprecated wx.lib.pubsub API')
makedepends=('mesa' 'glu' 'webkit2gtk' 'python-pathlib2' 'python-requests' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/w/wxPython/wxPython-$pkgver.post2.tar.gz")
sha512sums=('7af89db90a0f7e6b644d61c1ede01ec36a2c295e46d44692ae9dbc4af923310c1b498a52f45b02a89e8917d844c6abe67e5f3fdd9c1d51da3312899319a349e4')

prepare() {
  sed -i "s|WX_CONFIG = 'wx-config'|WX_CONFIG = 'wx-config-gtk3'|" $_pkgname-$pkgver.post2/build.py
}

build() {
  cd "$_pkgname-$pkgver.post2"

  python3.7 build.py build --use_syswx --release
}

package() {
  cd "$_pkgname-$pkgver.post2"

  python3.7 build.py install --destdir="$pkgdir"
  for file in "${pkgdir}"/usr/bin/*; do mv "${file}" "${file}3.7"; done

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  find "$pkgdir/usr/lib" -type f | xargs chmod 644
}

