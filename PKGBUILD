# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.5.0
pkgrel=5
pkgdesc='Pinyin (Chinese) input method for the IBus framework'
arch=('x86_64')
license=('GPL')
source="https://github.com/phuang/ibus-pinyin/"
depends=('ibus' 'pyzy' 'lua51' 'python2-xdg')
makedepends=('intltool')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ibus/${pkgname}-${pkgver}.tar.gz")
md5sums=('f7728b5b785fae58e2b4de8dfda45612')

build() {
  cd ${pkgname}-${pkgver}

  sed -i -e "s|python|python2|" setup/ibus-setup-pinyin.in

  PYTHON=python2 ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
