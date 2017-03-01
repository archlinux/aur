# Contributor: Sérgio Martins <iamsergio@gmail.com>
# Contributor: Ainola
# Maintainer: kaptoxic

pkgname=flow-pomodoro
pkgver=1.2.0
pkgrel=2
pkgdesc="A pomodoro app that blocks distractions while you work."
arch=('i686' 'x86_64')
url="https://github.com/iamsergio/flow-pomodoro"
license=('GPL2')
depends=('qt5-declarative')
source=("https://github.com/iamsergio/flow-pomodoro/archive/v$pkgver.zip")
sha256sums=('91598e73fe4302658620bc00427161b91ef5450046e316751a1a399d0530998e')

build() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  qmake ../flow.pro
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make INSTALL_ROOT="$pkgdir/usr/" install
  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/$pkgname-$pkgver/flow.desktop" \
                 "$pkgdir/usr/share/applications/flow.desktop"
}
