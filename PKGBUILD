# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.5.0
pkgrel=7
pkgdesc='Pinyin (Chinese) input method for the IBus framework'
arch=('x86_64')
license=('GPL')
source="https://github.com/phuang/ibus-pinyin/"
depends=('ibus' 'pyzy' 'lua51' 'python2-xdg')
makedepends=('intltool')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ibus/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b0cd849ee3154543747dde8994eec9aed01d67e0d9be308a2f0230cf22f0281cd8fcabd9763b24238547a37e54400bcd8e541937767b93f005d04302f0c00241')

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
