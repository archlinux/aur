# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=proguard
vertag=7.1.0-beta3
pkgver=${vertag//-/}
pkgrel=1
pkgdesc="free Java class file shrinker, optimizer, obfuscator, and preverifier"
arch=(any)
url="http://proguard.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=("https://github.com/Guardsquare/proguard/releases/download/v$vertag/proguard-$vertag.tar.gz")
sha256sums=('454b887a6d3b340384eee2f273b725c22f6dcb0d9075a0636605534a0b2a35b7')

package() {
  cd "$srcdir/$pkgname-$vertag/lib"

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
