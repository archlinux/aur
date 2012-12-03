# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=radegast
pkgver=2.6
pkgrel=1
pkgdesc="Lightweight client for connecting to Second Life and OpenSim worlds"
arch=('any')
url="http://radegast.org"
license=('BSD')
depends=('mono')
makedepends=('nant')
source=(http://radegast.googlecode.com/files/$pkgname-$pkgver-src.zip
        radegast.desktop radegast)
sha256sums=('62d679c35b5ed614827e98b37f3651c2ac36dafe1ea247eb0d5b1a8b05f2aac0'
            '8f599f04f263361cd45f7af53cfae633881bfa92ba3f806a0ca675d1ee131567'
            '73cdc80cc4abeb6ba368b09285ff5120ffeb6052a0a5e5ac0febf08c38bb0e96')

build() {
  cd "${srcdir}"/$pkgname-$pkgver-src/$pkgname
  ./runprebuild.sh
  nant
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver-src/$pkgname/bin
  find . -type d -print0 | xargs -0 chmod 755
  find . -type f -print0 | xargs -0 chmod 644
  install -dm755 "${pkgdir}"/usr/share/Radegast
  cp -a * "${pkgdir}"/usr/share/Radegast
  install -Dm644 ../Radegast/radegast.png "${pkgdir}"/usr/share/icons/radegast.png
  install -Dm644 "${srcdir}"/radegast.desktop "${pkgdir}"/usr/share/applications/radegast.desktop
  install -Dm755 "${srcdir}"/radegast "${pkgdir}"/usr/bin/radegast
}

# vim:set ts=2 sw=2 et:
