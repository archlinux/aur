# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Some parts of this file inspired from czmq-git, ansible-core-git, and spotify packages.

pkgname=mtodo
pkgver=20190223
pkgrel=1
pkgdesc='Simple Todo Software for GNU/Linux'
arch=('i686' 'x86_64')
url='https://github.com/mortymacs/mtodo'
license=('GPL')
depends=('python3' 'python-gobject' 'gtk3')
makedepends=('git')
source=('git+https://github.com/mortymacs/mtodo')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  echo "installing license..."
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/mtodo"

  echo 'installing packages...'
  mkdir -p "${pkgdir}/opt/mtodo"
  cp -r ./bin "${pkgdir}/opt/mtodo"
  cp -r ./src "${pkgdir}/opt/mtodo"
  cp -r ./styles "${pkgdir}/opt/mtodo"
  chmod -R 655 "${pkgdir}/opt/mtodo"
  install -Dm 644 mtodo.png "${pkgdir}/usr/share/pixmaps/mtodo.png"
  install -Dm 644 mtodo.png "${pkgdir}/opt/mtodo/mtodo.png"
  install -Dm 644 ../../mtodo.desktop "${pkgdir}/usr/share/applications/mtodo.desktop"

  echo 'cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
