# Maintainer: revel <revelΘmuub·net>

pkgname=gpass
pkgver=0.5.1
pkgrel=4
pkgdesc='A password manegement software for GNOME2 desktop.'
arch=('i686' 'x86_64')
url='http://projects.netlab.jp/gpass/'
license=('GPL2')
depends=('libgnomeui' 'gtk2' 'mhash' 'libmcrypt')
#install=gpass.install
#source=("http://projects.netlab.jp/$pkgname/release/${pkgname}-${pkgver}.tar.gz"
source=("https://github.com/raffael-sfm/$pkgname/releases/download/$pkgver/${pkgname}-${pkgver}.tar.gz"
        'linking.patch'
        'gerror.patch'
        'compilation.patch'
        'compilation2.patch')
sha256sums=('0a8216538144e34188e07bcc9f0415c36702fcb90890ddfbf75a594e5864a881'
            'b96b0fab02c2c849178fcf986565e830bbd647d22a2f4491ad6b42f86a19af06'
            '36140942553b61ab21dc7846bff0e8bbe5685a7ecb429e3f3126dd6a60a9f0e6'
            '2746e0b954baa51357f1138b65f0e941ae2ec88238b227636b00faa7b23f32bc'
            'b8ca8e0285704aa81f88957aa94812bd9c502d634c3d7ef57be04470b4e8cf25')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../linking.patch
  patch -p1 -i ../gerror.patch
  patch -p1 -i ../compilation.patch
  patch -p1 -i ../compilation2.patch
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/usr/share --mandir=/usr/share/man
  make LDFLAGS+=-Wl,--export-dynamic
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
