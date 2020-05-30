# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyxel
pkgver=1.4.1
pkgrel=1
pkgdesc='Retro game development environment'
arch=('i686' 'x86_64')
url='https://github.com/kitao/pyxel'
license=('MIT')
depends=('portaudio' 'python-glfw' 'python-opengl'
         'python-pillow' 'python-sounddevice' 'sdl2_image')
optdepends=('pyinstaller')
makedepends=('python-setuptools')
source=("https://github.com/kitao/pyxel/archive/v$pkgver.tar.gz"
        "0001-optional-pyinstaller.patch")
md5sums=('bcfaeb709b3ec4ef8d7950fbb3a8af64'
         'f5246bfca012477b3a147f8c2228394a')

build() {
  cd pyxel-$pkgver

  patch -i "$srcdir"/0001-optional-pyinstaller.patch
  python setup.py build
}

package() {
  cd pyxel-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
