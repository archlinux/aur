# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Pablo Orduna <pabloorduna98@gmail.com>
# Contributor: Philippe Miron <tuxication@gmail.com>

pkgname=cryptocat
pkgver=3.2.08
pkgrel=1
pkgdesc='Encrypted chat client based on Electron'
arch=(x86_64)
url=https://crypto.cat
license=(GPL3)
depends=(glib2 fuse2 gconf)
makedepends=(npm)
conflicts=(cryptocat-bin)
options=(!strip)
source=(git+https://github.com/cryptocat/cryptocat#commit=f528529631af43a2e8a4401efe1b10558aa26a92
        cryptocat.desktop)
sha512sums=(SKIP
            8d26d0c292b48a61f4ee6c131160eb99c30b0c62ea4021bbf8bb0fbf849f79f1042f3cc3a2a7c8d312addc3cef1460dbfcd0cf6ac9c2946cd4479d529eeb2db8)

#pkgver() {
#  cd cryptocat
#  echo 0+$(git rev-list --count HEAD)+g$(git describe --always)
#}

build() {
  cd cryptocat
  npm install
  npm install electron-builder
  npm run linux
}

package() {
  install -d $pkgdir/usr/{share,bin}
  cp -a cryptocat/dist/linux-unpacked $pkgdir/usr/share/cryptocat
  find $pkgdir/usr/share/cryptocat -type f -exec chmod 644 {} +
  chmod +x $pkgdir/usr/share/cryptocat/cryptocat
  ln -s /usr/share/cryptocat/cryptocat $pkgdir/usr/bin/cryptocat
  install -Dm 644 cryptocat.desktop $pkgdir/usr/share/applications/cryptocat.desktop
  install -Dm 644 cryptocat/website/img/logo.png $pkgdir/usr/share/pixmaps/cryptocat.png
  install -Dm 644 cryptocat/LICENSE.md $pkgdir/usr/share/licenses/cryptocat/LICENSE
}
