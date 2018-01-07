# $Id: PKGBUILD 246343 2017-07-25 17:22:46Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=proguard
pkgver=5.3.3
pkgrel=1
pkgdesc="free Java class file shrinker, optimizer, obfuscator, and preverifier"
arch=(any)
url="http://proguard.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/proguard/proguard$pkgver.tar.gz)
sha256sums=('95bf9580107f00d0e26f01026dcfe9e7a772e5449488b03ba832836c3760b3af')

package() {
  cd "$srcdir/$pkgname$pkgver/lib"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/proguard
  install -D -m0644 proguardgui.jar proguard.jar retrace.jar "$pkgdir"/usr/share/proguard/

  cat >"$pkgdir"/usr/bin/proguardgui <<EOF
#!/bin/sh
exec java -jar /usr/share/proguard/proguardgui.jar \$*
EOF
  chmod 0755 "$pkgdir"/usr/bin/proguardgui

  cat >"$pkgdir"/usr/bin/proguard <<EOF
#!/bin/sh
exec java -jar /usr/share/proguard/proguard.jar \$*
EOF
  chmod 0755 "$pkgdir"/usr/bin/proguard

  # FS#36268
  ln -s . "$pkgdir"/usr/share/proguard/lib
}
