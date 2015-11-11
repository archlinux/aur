# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=papers-please-gog
pkgver=2.0.0.4
pkgrel=1
pkgdesc="A Dystopian Document Thriller (gog.com version)"
url="http://gog.com/game/papers_please"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('libgl' 'gcc-libs')
depends_x86_64=('lib32-libgl' 'lib32-gcc-libs')
source=("gog_papers_please_$pkgver.sh"::"gogdownloader://papers_please/installer_linux_en"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('13a37a037ef9bda90ac77e878415e678e53814c2ebaf2be29819b0cad297f5ad'
            '9227f364836b975d05609481c0d67e7b6fd8e52f7bb931b39af98d864b296d2e'
            '3273cd3c3f35495d00debbd0d10ad2d188b8cf1b40bc9a754c7e4c6fe82173f6')
PKGEXT=".pkg.tar"

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

package() {
  cd data/noarch
  install -d "$pkgdir"/opt/papers-please
  # data - binaries
  cp -rup game/* "$pkgdir"/opt/papers-please
  # doc + license
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  install -m644 docs/README support/support_notice.txt "$pkgdir"/usr/share/doc/$pkgname
  install -m644 docs/"End User License Agreement.txt" game/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
  # .desktop file and launcher
  install -Dm644 support/icon.png "$pkgdir"/usr/share/pixmaps/papers-please.png
  cd "$srcdir"
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/papers-please.desktop
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/papers-please
}
