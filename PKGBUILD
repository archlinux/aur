# Maintainer: erslly <contact@erslly.dev>
pkgname=animecix-linux
pkgver=1.0.0
pkgrel=2
pkgdesc="Animecix için unofficial Linux masaüstü uygulaması"
arch=('x64')
url="https://github.com/erslly/animecix-linux"
license=('MIT')
depends=('electron' 'socat')
makedepends=('npm')
source=("git+$url.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  npm install
}

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r main.js preload.js animecix.png node_modules "$pkgdir/usr/lib/$pkgname/"
  install -dm755 "$pkgdir/usr/bin"
  printf "#!/usr/bin/sh\nelectron /usr/lib/$pkgname/main.js \"\$@\"" > "$pkgdir/usr/bin/animecix"
  chmod 755 "$pkgdir/usr/bin/animecix"
  install -dm755 "$pkgdir/usr/share/applications"
  printf "[Desktop Entry]\nName=Animecix\nExec=animecix\nIcon=/usr/lib/$pkgname/animecix.png\nType=Application\nCategories=Video;AudioVideo;" > "$pkgdir/usr/share/applications/animecix.desktop"
}
