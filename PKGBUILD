# Maintainer: Jonathon Fernyhough <jonathon_at_m2x.dev>

pkgname=hopper
_pkgname=hopperv4
pkgver=4.7.0
pkgrel=1
pkgdesc="Reverse engineering tool that lets you disassemble, decompile and debug your applications"
arch=(x86_64)
url="https://www.hopperapp.com/"
license=('Commercial')
depends=('hicolor-icon-theme' 'libbsd' 'python2' 'qt5-base' 'ncurses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-$pkgver-Linux.pkg.tar.xz"
        'LICENSE')
sha1sums=('9b8a0e08b89ae9efaf43ac6f00bd18bc5920458d'
          'c3f410d29524eb02a8bf3dc1b29aaeb82b1844e6')
changelog=ChangeLog

package() {
  # Copy package content
  cp -r "$srcdir"/opt "$pkgdir"/opt
  cp -r "$srcdir"/usr "$pkgdir"/usr

  # Move docs to /opt
  mv "$pkgdir"/usr/share/doc/hopperv4 "$pkgdir"/opt/hopper-v4/doc
  ln -s /opt/hopper-v4/doc "$pkgdir"/usr/share/doc/hopperv4

  # Remove launcher from Accessories
  sed -i '10s|Utility;||' "$pkgdir"/usr/share/applications/hopper-v4.desktop

  # Install license file
  # https://www.hopperapp.com/license_agreement.html @ 2017-08-14
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Temporary hacky fix for upstream packaging issue
  cd "$pkgdir"/opt/hopper-v4/lib
  ln -s /usr/lib/libformw.so.6    libform.so.6
  ln -s /usr/lib/libncursesw.so.6 libncurses.so.6
  ln -s /usr/lib/libtinfo.so.6    libtinfo.so.6
}
