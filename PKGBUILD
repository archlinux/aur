# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo
pkgver=0.8.5
pkgrel=2
pkgdesc='Shell-centric cross-platform MongoDB management tool'
arch=('i686' 'x86_64')
url="http://robomongo.org/"
license=('GPLv3')
depends=('qt5-base' 'libxkbcommon-x11' 'pcre' 'qjson' 'openssl')
makedepends=('cmake' 'scons')
conflicts=('robomongo-bin')
source=("https://github.com/paralect/robomongo/archive/v$pkgver.tar.gz")
md5sums=('e203d548390282e00e2c27c5bd42b5ea')

prepare() {
  if [ "$CARCH" = 'i686' ]
  then _arc='32'
  else _arc='64'
  fi
}

build() {
  cd $srcdir/$pkgname-$pkgver/
  mkdir ./target && cd ./target/
  cmake .. -DCMAKE_BUILD_TYPE=Release -DOS_ARC=${_arc}
  make
  make install
}

package() {
  _origdir=$srcdir/$pkgname-$pkgver/target/install

  install -Dm0755 "${_origdir}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "${_origdir}/share/applications/robomongo.desktop" "${pkgdir}/usr/share/applications/robomongo.desktop"
  install -Dm0644 "${_origdir}/share/icons/robomongo.png" "${pkgdir}/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "${_origdir}/LICENSE" "${pkgdir}/usr/share/licenses/robomongo/LICENSE"
}
