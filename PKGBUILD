# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

pkgname=gsi-sshterm
pkgver=0.91h
pkgrel=1
pkgdesc='Java Grid authentication program by the UK National Grid Service'
arch=('i686' 'x86_64')
url='http://wiki.ngs.ac.uk/index.php?title=GSI-SSHTerm'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6321ca4aea8fac276db1fb182fa8331303fdbf52367bc9b1252affaf0aa15364')

build() {
  cd "sshtools"
  JAVA_HOME=/usr/lib/jvm/default ./make.sh
}

package() {
  cd "sshtools"

  mkdir -p "$pkgdir"/opt
  cp -r release/GSI-SSHTerm-$pkgver/ "$pkgdir"/opt/GSI-SSHTerm/

  mkdir -p "$pkgdir"/usr/bin
  printf '%s\n' \
    '#!/bin/sh'                                   \
    'export SSHTOOLS_HOME="/opt/GSI-SSHTerm"'     \
    'exec "$SSHTOOLS_HOME/bin/sshterm.sh" "$@"'   \
    > "$pkgdir"/usr/bin/gsi-sshterm
  chmod a+x "$pkgdir"/usr/bin/gsi-sshterm
}

# vim: ft=sh:ts=2:sw=2:et
