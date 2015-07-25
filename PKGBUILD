# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk

pkgname='python-cocos2d'
pkgver=0.6.3
pkgrel=2
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
source=("https://pypi.python.org/packages/source/c/cocos2d/cocos2d-$pkgver.zip")
options=('!emptydirs')
md5sums=('20457957eb4e836fb2613f4be260485a')

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
