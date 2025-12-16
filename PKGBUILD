# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.1.0
pkgname=lemonade-desktop
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)"
pkgver=9.1.0
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
depends=('electron')
optdepends=('lemonade-server')
makedepends=('npm')
provides=('lemonade-desktop')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
'f5b3a1bafd92b40721057c5521e0e655a6af2c5725f75dc647045ce263ede758'
)

prepare() {
  cd $srcdir/lemonade-$pkgver/src/app
  npm install
}

build() {
  cd $srcdir/lemonade-$pkgver/src/app
  npm run build
}

package() {
  cd "$srcdir/lemonade-$pkgver/src/app/dist-app/"
  mkdir -p "${pkgdir}/usr/share/lemonade-desktop/"
  cp -r linux-unpacked/* "$pkgdir/usr/share/lemonade-desktop/"
  #install -Dm0644 "linux-unpacked"/* -t "$pkgdir/usr/share/lemonade-desktop/"
  #install -Dm0644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/"
}
