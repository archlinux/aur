# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.5.0
pkgrel=8
pkgdesc='Pinyin (Chinese) input method for the IBus framework'
arch=('x86_64')
license=('GPL')
url="https://github.com/phuang/ibus-pinyin/"
depends=('ibus' 'pyzy' 'lua')
makedepends=('intltool')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ibus/${pkgname}-${pkgver}.tar.gz"
        'ibus-pinyin-fixes-lua-compile.patch')
sha512sums=('b0cd849ee3154543747dde8994eec9aed01d67e0d9be308a2f0230cf22f0281cd8fcabd9763b24238547a37e54400bcd8e541937767b93f005d04302f0c00241'
            '4d62521eca39099f71824c0fdafcdda41b3920a25411e520023dd20343554f691a6c9629c80977849d70724ad7aa31cae1345d452ba6a8d15019f835c91f3913')

prepare()
{
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../ibus-pinyin-fixes-lua-compile.patch
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
