# Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=moneydance
pkgver=2019.1855
pkgrel=1
epoch=
pkgdesc="A personal finance manager for Mac, Windows and Linux"
arch=('i686' 'x86_64')
url="https://www.moneydance.com/"
license=('custom')
groups=()
depends=('java-runtime' 'jre-openjdk' 'bash')
checkdepends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('moneydance.sh' 'moneydance.desktop')
source_x86_64=(${pkgname}_amd64-${pkgver}-${pkgrel}.tar.gz::https://infinitekind.com/stabledl/current/Moneydance_linux_amd64.tar.gz)

package() {
  # generate directories in $pkgdir
  install -m755 -d "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/java/$pkgname" \
    "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/pixmaps"

  # copy files
  cd "$srcdir"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname" || return 1
  install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" || return 1

  # copy Mac icon since they're higher res

  cd "$srcdir/Moneydance/lib"
  bsdcpio --extract --make-directories "com/moneydance/apps/md/view/gui/glyphs/appicon_128.png" < $pkgname.jar || return 1

  cd "$srcdir/${pkgname^}"
  #patch -uN "resources/moneydance.desktop" "../moneydance.patch"
  #install -m644 "moneydance.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" || return 1
  install -m644 "resources/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  install -m644 lib/com/moneydance/apps/md/view/gui/glyphs/appicon_128.png "$pkgdir/usr/share/pixmaps/$pkgname.png" || return 1
  install -m644 lib/*.jar "$pkgdir/usr/share/java/$pkgname" || return 1
}
sha256sums=('48304a6859a97210abf103d899e5eadc113ee1642a3bde78a92ece77a9694125'
            '242dc66a95c4842099e41092bd87ccaf97c314bed1f9865f5c6a72f135f7de21')
sha256sums_x86_64=('e4c566a9f89df32c6d538be022fd4f02a62ae36392155847cec7e42cf8b43dfa')
