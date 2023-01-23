# Maintainer: plokid <910576949@qq.com>

pkgname=imewlconverter
pkgver=2.9.0.86.gcf86d15
pkgrel=1
pkgdesc="一款开源免费的输入法词库转换程序"
arch=('x86_64' 'i686')
url="https://github.com/studyzy/imewlconverter"
license=('GPL3')
depends=('dotnet-runtime-6.0')
provides=('imewlconverter')
conflicts=('imewlconverter')
makedepends=('git' 'dotnet-sdk-6.0')
source=("git+https://github.com/studyzy/imewlconverter")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd $pkgname
  make release
}

package() {
  mkdir -p $pkgdir/usr/share/imewlconverter
  mv $srcdir/imewlconverter/src/ImeWlConverterCmd/bin/Release/net6.0/* $pkgdir/usr/share/imewlconverter
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/imewlconverter/ImeWlConverterCmd $pkgdir/usr/bin/ImeWlConverterCmd
  ln -s /usr/share/imewlconverter/ImeWlConverterCmd $pkgdir/usr/bin/imewlconverter
}

