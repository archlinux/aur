# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.1.1
pkgname=lemonade-desktop
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)"
pkgver=9.1.1
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
'e46d2c47c3140ba7a6213342e7a593bbd4fbf236ed950f9899a3c60ae187e3a8'
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
