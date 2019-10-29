# Maintainer: Corey Bruce <cdfrosty@gmail.com>

pkgname=gamerworld
_pkgname=GamerWorld-linux-x64
pkgver=1.1.4
pkgrel=1
pkgdesc="Play games all in one place"
arch=('x86_64')
url="https://gitlab.com/gamerworld/application"
license=('GPL')
depends=(nss gtk3 libxss)
makedepends=('nodejs' 'git')
provides=('gamerworld')
conflicts=()
source=("git+https://gitlab.com/gamerworld/application.git")

md5sums=("SKIP")

build() {
  cd "$srcdir/application"
  npm i electron electron-packager
  ./node_modules/.bin/electron-packager .
}

package() {
    cd "$srcdir/application/${_pkgname}"
    mkdir -p $pkgdir/opt/GamerWorld/
  # Exec bit
  chmod 755 "$pkgdir/opt/GamerWorld/"
    cp -r ./ $pkgdir/opt/GamerWorld/

# Desktop Entry
  install -Dm 644 "$srcdir/application/GamerWorld.desktop" "${pkgdir}/usr/share/applications/GamerWorld.desktop"
  sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/GamerWorld.desktop
}
