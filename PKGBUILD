# Maintainer: atrax <***** at prtn dot email where ***** is atrax> 

pkgname=vger
pkgver=2.0.1
pkgrel=1
pkgdesc="Gemini server written in C"
arch=('x86_64' 'armv7h')
url="https://tildegit.org/solene/vger"
license=('BSD')
depends=(libbsd)
optdepends=('xinetd: Network support'
            'stunnel: TLS support')
source=("https://tildegit.org/solene/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bba0f595cf6ded1ee423f1ec5ef078f06faf4bbe1d2b8fb63add7b6ea2f836ed')

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
