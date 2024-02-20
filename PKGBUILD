# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=proguard
vertag=7.4.2
pkgver=${vertag//-/}
pkgrel=1
pkgdesc="free Java class file shrinker, optimizer, obfuscator, and preverifier"
arch=(any)
url="http://proguard.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=("https://github.com/Guardsquare/proguard/releases/download/v$vertag/proguard-$vertag.tar.gz")
sha256sums=('f5d88ec3074ef4578cd7b1250b511b45d6bca89e734bc175d671e4a0aaa95ae0')

package() {
  cd "$srcdir/$pkgname-$vertag/lib"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/proguard
  install -D -m0644 proguard-ant.jar proguard.jar proguardgui.jar retrace.jar "$pkgdir"/usr/share/proguard/

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
