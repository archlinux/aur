# Maintainer: Haruki Ota <ootaharuki99[at]gmail.com>
pkgname=libarib25-git
pkgver=0.2.5+9c2c83c
pkgrel=1
pkgdesc='ARIB STD-B25 library for Linux.'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/stz2012/libarib25'
license=('custom')
makedepends=('git' 'cmake')
depends=('pcsclite')
provides=('libarib25')
conflicts=('libarib25')
source=('git+https://github.com/stz2012/libarib25.git#commit=9c2c83ca0673ae58b1e4335ea83eb3f3c0530e8c')
md5sums=('SKIP')

build() {
  cd "$srcdir/$provides/cmake"

  cmake ..
  make
}

package() {
  cd "$srcdir/$provides/cmake"

  make install DESTDIR=root
  install -d $pkgdir/usr/
  cp -r -p root/usr/local/bin $pkgdir/usr/
  cp -r -p root/usr/local/lib $pkgdir/usr/
  cp -r -p root/usr/local/include $pkgdir/usr/

  echo "　・ソースコードを利用したことによって、特 許上のトラブルが発生しても
　　茂木 和洋は責任を負わない
　・ソースコードを利用したことによって、プログラムに問題が発生しても
　　茂木 和洋は責任を負わない

　上記 2 条件に同意して作成された二次的著作物に対して、茂木 和洋は
　原著作者に与えられる諸権利を行使しない
" > LICENSE
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
