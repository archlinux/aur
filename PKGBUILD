# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-pyxel
pkgver=1.2.6
pkgrel=1
pkgdesc='Retro game development environment'
arch=('i686' 'x86_64')
url='https://github.com/kitao/pyxel'
license=('MIT')
depends=('portaudio' 'python-glfw' 'python-numpy' 'python-opengl'
         'python-pillow' 'python-sounddevice' 'sdl2_image')
optdepends=('pyinstaller')
makedepends=('python-setuptools')
source=("https://github.com/kitao/pyxel/archive/v$pkgver.tar.gz"
        "0001-optional-pyinstaller.patch")
md5sums=('ddd3e8211ca2bbc71ac99845bdcb16c0'
         '1e9509ebffc17ed518dbec3a34b8ed21')

build() {
  cd pyxel-$pkgver

  patch -i $srcdir/0001-optional-pyinstaller.patch
  python setup.py build
}

package() {
  cd pyxel-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
