# Maintainer: FennecTECH <fennectech@gmail.com>
# Thank to
# Latif Khalifa for the radegast project
# Cinder Roxley For mantaining the project
# Chungy Nexen For the origional radegast aur package
# Robot Silvershade  For teaching me most of the things I know.
# Zach Ward & Beth Randall   They have been there from my best day to my worst
# And everyone else who I did'nt mention by name    You are all important to me
pkgname=radegast-ng
pkgver=2.33.144
pkgrel=1.5
pkgdesc="Lightweight client for connecting to Second Life and OpenSim worlds"
arch=('i686' 'x86_64')
url="http://radegast.org"
license=('BSD')
depends=('mono')
conflicts=('radegast' 'radegast-git')
makedepends=('dos2unix' 'recode')
source=(https://bitbucket.org/cinderblocks/radegast/downloads/Radegast-${pkgver}.tbz
        radegast.desktop radegast)
sha256sums=('91313f85cc0a215b0f6a47b95ed4e17fcf24f3ba19f41dbd169786bf75a3f5d5'
            '8f599f04f263361cd45f7af53cfae633881bfa92ba3f806a0ca675d1ee131567'
            '73cdc80cc4abeb6ba368b09285ff5120ffeb6052a0a5e5ac0febf08c38bb0e96')
package() {
  cd ../src/net471
  find . -type d -print0 | xargs -0 chmod 755
  find . -type f -print0 | xargs -0 chmod 644
  install -dm755 "${pkgdir}"/usr/share/Radegast
  cp -a -- * "${pkgdir}"/usr/share/Radegast
  install -Dm644 ../net471/radegast.png "${pkgdir}"/usr/share/icons/radegast.png
  install -Dm644 "${srcdir}"/radegast.desktop "${pkgdir}"/usr/share/applications/radegast.desktop
  install -Dm755 "${srcdir}"/radegast "${pkgdir}"/usr/bin/radegast

  install -dm755 "${pkgdir}"/usr/share/licenses/radegast
  recode windows-1252..utf8 < ../net471/license.txt > "${pkgdir}"/usr/share/licenses/radegast/COPYING
}

# vim:set ts=2 sw=2 et:
