# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk
# Contributor: Eric Toombs <ee double you toombs at you waterloo dot see eh?>

pkgname='python-cocos2d'
pkgver=0.6.4
pkgrel=1
pkgdesc='A framework for building graphical/interactive applications.'
arch=('any')
url='http://python.cocos2d.org/'
license=('BSD' 'LGPL' 'custom')
depends=('python>=3.3' 'python-pyglet>=1.2')
optdepends=(
    'python-numpy: for particles support'
    'avbin: for audio and video support'
    'sdl: for audio support'
    'sdl_mixer: for audio support'
    )
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/29/40/f50642e41f7be90962f1a19d19274638844411b11bca0cd5933462efdaad/cocos2d-$pkgver.zip")
options=('!emptydirs')
md5sums=('4ec4abc9ce64a13ecc814572db0a8b3a')

build() {
  cd "cocos2d-$pkgver"
  python setup.py build
}

package() {
  cd "cocos2d-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a samples "$pkgdir/usr/share/$pkgname"

  # licenses
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -a LICENSE* "$pkgdir/usr/share/licenses/$pkgname"
}
