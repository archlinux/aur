# Maintainer: -=De/\/=-
# Author: Ezequiel Rabelo de Aguiar <ezeq.cruel@gmail.com>
# Contributor: Ezequiel Rabelo de Aguiar <ezeq.cruel@gmail.com>

pkgname=cadzinho
pkgver=0.6.0
luaver=5.4.6
pkgrel=1
pkgdesc="Minimalist computer aided design (CAD) software"
arch=('x86_64')
url='https://github.com/zecruel/CadZinho'
license=('MIT')

depends=('sdl2' 'glew' 'libglvnd' 'sdl2_net')

source=(https://github.com/zecruel/CadZinho/archive/refs/tags/$pkgver.tar.gz
        http://www.lua.org/ftp/lua-$luaver.tar.gz)

prepare() {
  rm lua-$luaver/src/lua.c lua-$luaver/src/luac.c
  cp lua-$luaver/src/* CadZinho-$pkgver/src/
  cd CadZinho-$pkgver
  cp linux/Makefile ./Makefile
}

build() {
  cd CadZinho-$pkgver
  make
}

package() {
  cd ${srcdir}
  install -dm755 ${pkgdir}/usr/share/{cadzinho,applications,icons}
  cp -r ${srcdir}/CadZinho-$pkgver/linux/CadZinho/share/* ${pkgdir}/usr/share
  install -Dm644 ${srcdir}/CadZinho-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir $pkgdir/usr/share/$pkgname/lang/
  install -m644 ${srcdir}/CadZinho-$pkgver/lang/*.lua "$pkgdir/usr/share/$pkgname/lang/"
  install -D -m755 ${srcdir}/CadZinho-$pkgver/cadzinho ${pkgdir}/usr/bin/cadzinho
}
sha256sums=('8f7341d37e80736755f67e0f73be128e3a5514a862c6179f25ac338fe9034908'
            '7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88')
