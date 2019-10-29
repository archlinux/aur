pkgname=googleplaymusic
_pkgname=GooglePlayMusic-linux-x64
pkgver=1.1.5
pkgrel=5
pkgdesc="Google Play Music is a unofficial client to play your music."
arch=('x86_64')
url="https://gitlab.com/coreybruce/GooglePlayMusic"
license=('GPL')
depends=(nss gtk3 libxss)
makedepends=('nodejs' 'npm' 'git')
provides=('googleplaymusic')
conflicts=()
source=("git+https://gitlab.com/google-play-music-desktop/application.git")

md5sums=("SKIP")

build() {
  cd "$srcdir/application"
  npm i electron electron-packager
  ./node_modules/.bin/electron-packager .    
}

package() {
    cd "$srcdir/application/${_pkgname}"
    mkdir -p $pkgdir/opt/GooglePlayMusic/
  # Exec bit
  chmod 755 "$pkgdir/opt/GooglePlayMusic/"
    cp -r ./ $pkgdir/opt/GooglePlayMusic/

# Desktop Entry
  install -Dm 644 "$srcdir/application/GooglePlayMusic.desktop" "${pkgdir}/usr/share/applications/GooglePlayMusic.desktop"
  sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/GooglePlayMusic.desktop
}
