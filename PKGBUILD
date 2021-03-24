# Maintainer: atrax <***** at prtn dot email where ***** is atrax> 

pkgname=vger
pkgver=1.06
pkgrel=3
pkgdesc="Gemini server written in C"
arch=('x86_64' 'armv7h')
url="https://tildegit.org/solene/vger"
license=('BSD')
depends=(libbsd)
optdepends=('xinetd: Network support'
            'stunnel: TLS support')
source=("https://tildegit.org/solene/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0d1c9564f509c68cbf8408874b33c4e21cb41c9b7cf71d10d229e4ac2f6de860')

prepare() {
  cd "$srcdir"/${pkgname}
  sed -i 1s/$/-lbsd/ config.mk
}

build() {
  cd "$srcdir"/${pkgname}
  make
}

package() {
  cd "$srcdir"/${pkgname}
  install -Dm755 vger -t "$pkgdir/usr/bin/"
  install -Dm644 vger.8 -t "$pkgdir/usr/share/man/man8/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
