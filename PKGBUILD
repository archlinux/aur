# Maintainer: daedaevibin <daedaevibin@ik.me>
pkgname=clippy-gemini
pkgver=0.5.3
pkgrel=1
pkgdesc="Clippy"
arch=('x86_64')
url="https://github.com/daedaevibin/clippy"
license=('MIT')
depends=('electron39')
makedepends=('npm' 'typescript')
source=("clippy::git+https://github.com/daedaevibin/clippy.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/clippy"
  npm i
  npm run package
}

package() {
  cd "$srcdir/clippy"
  install -d "$pkgdir/opt/$pkgname"
  cp -r out/Clippy-linux-x64/* "$pkgdir/opt/$pkgname"

  # Ensure assets are present
  install -d "$pkgdir/opt/$pkgname/assets"
  if [ -d "assets" ]; then
    cp -r assets/* "$pkgdir/opt/$pkgname/assets"
  fi

  cd ../../
  install -Dm755 "clippy-wrapper.sh" "$pkgdir/usr/bin/clippy"
  install -Dm644 "clippy.desktop" "$pkgdir/usr/share/applications/clippy.desktop"
}
