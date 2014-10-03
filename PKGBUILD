# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Hakim Zulkufli <acrox999@gmail.com>

pkgname=opensurge-svn
pkgver=r765
pkgrel=1
pkgdesc="Retro-style 2D sidescroller inspired by old-school sonic games (development version)"
arch=('i686' 'x86_64')
url="http://opensnc.sourceforge.net/"
license=('GPL2')
depends=('alure' 'alfont')
makedepends=('cmake' 'svn')
source=(${pkgname%-*}::"svn+http://svn.code.sf.net/p/opensnc/code/opensurge/trunk"
        "${pkgname%-*}.desktop"
        "${pkgname%-*}.sh")
sha256sums=('SKIP'
            '04bc0d01613bb61553a753c0cbbc7be727ea4ee57078284832faaea32d3bd2fb'
            'accfeeaf152bed5332c1c5e87fae3f4f1f344ed195dd18089b8bd38bf6fa3813')

pkgver() {
  cd ${pkgname%-*}

  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${pkgname%-*}

  cmake .
  make
}

package() {
  cd ${pkgname%-*}

  make DESTDIR="$pkgdir/" install
  msg2 "Please ignore the above error about copying the executable, we use a launcher script for Arch Linux."
  install -Dm755 ../${pkgname%-*}.sh "$pkgdir"/usr/bin/${pkgname%-*}
  # .desktop entry
  install -Dm644 ../${pkgname%-*}.desktop "$pkgdir"/usr/share/applications/${pkgname%-*}.desktop
  install -Dm644 src/misc/${pkgname%-*}_48x48.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png
}
