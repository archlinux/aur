# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk
# Contributor: Eric Toombs <ee double you toombs at you waterloo dot see eh?>
# Maintainer: Thomas Koller-Cherek <tk120 at protonmail dot com>

pkgname='python-cocos2d'
pkgver=0.6.7
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
source=("https://files.pythonhosted.org/packages/86/b2/6916b09f071a3f9597b84007ffeca9391c8fff264fb7d7b0d521224e6596/cocos2d-$pkgver.tar.gz")
options=('!emptydirs')
md5sums=('0e9e955a4e0fbd00ac5979b1c93b9145')

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

