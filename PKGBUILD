# Maintainer:  Xiaoxiao Pu <i@xiaoxiao.im>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=ttyrec
pkgver=1.0.8
pkgrel=2
pkgdesc="A tty recorder and player"
arch=('i686' 'x86_64')
url="http://0xcc.net/ttyrec/index.html.en"
license=('BSD')
depends=('glibc')
source=("http://0xcc.net/ttyrec/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ef5e9bf276b65bb831f9c2554cd8784bd5b4ee65353808f82b7e2aef851587ec')

build() {
  cd $srcdir/$pkgname-$pkgver
  make CFLAGS+="-DSVR4 -DHAVE_inotify -D_XOPEN_SOURCE=500"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # install executable files
  install -Dm755 ttyrec ${pkgdir}/usr/bin/ttyrec
  install -Dm755 ttyplay ${pkgdir}/usr/bin/ttyplay
  install -Dm755 ttytime ${pkgdir}/usr/bin/ttytime
  # install README
  install -Dm644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  # install man page
  install -Dm644 ttyrec.1 ${pkgdir}/usr/share/man/man1/ttyrec.1
  install -Dm644 ttyplay.1 ${pkgdir}/usr/share/man/man1/ttyplay.1
  install -Dm644 ttytime.1 ${pkgdir}/usr/share/man/man1/ttytime.1
}
