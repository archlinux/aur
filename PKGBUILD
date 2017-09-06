# Maintainer: FennecTECH <fennectech@gmail.com>
# Thank you
# Latif Khalifa for the radegast project
# Cinder Roxley For mantaining the project
# Chungy Nexen For the origional radegast aur package
# Robot Silvershade  For teaching me most of the things I know.
# 
pkgname=radegast-ng
pkgver=2.24.105
pkgrel=1.12
pkgdesc="Lightweight client for connecting to Second Life and OpenSim worlds"
arch=('i686' 'x86_64')
url="http://radegast.org"
license=('BSD')
depends=('mono')
conflicts=('radegast' 'radegast-git')
makedepends=('dos2unix' 'recode')
source=(https://bitbucket.org/cinderblocks/radegast/downloads/Radegast-${pkgver}.tbz
        radegast.desktop radegast)
sha256sums=('c9cdedb84de5153c6e754270c9756c2a78fba8b785b3e5487ab47cd9efc9a336'
            '8f599f04f263361cd45f7af53cfae633881bfa92ba3f806a0ca675d1ee131567'
            '73cdc80cc4abeb6ba368b09285ff5120ffeb6052a0a5e5ac0febf08c38bb0e96')
package() {
  cd ../src/bin
  find . -type d -print0 | xargs -0 chmod 755
  find . -type f -print0 | xargs -0 chmod 644
  install -dm755 "${pkgdir}"/usr/share/Radegast
  cp -a -- * "${pkgdir}"/usr/share/Radegast
  install -Dm644 ../bin/radegast.png "${pkgdir}"/usr/share/icons/radegast.png
  install -Dm644 "${srcdir}"/radegast.desktop "${pkgdir}"/usr/share/applications/radegast.desktop
  install -Dm755 "${srcdir}"/radegast "${pkgdir}"/usr/bin/radegast

  install -dm755 "${pkgdir}"/usr/share/licenses/radegast
  recode windows-1252..utf8 < ../bin/license.txt > "${pkgdir}"/usr/share/licenses/radegast/COPYING
}

# vim:set ts=2 sw=2 et:
