# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=proguard
pkgver=6.2.2
pkgrel=1
pkgdesc="free Java class file shrinker, optimizer, obfuscator, and preverifier"
arch=(any)
url="http://proguard.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=(https://downloads.sourceforge.net/project/proguard/proguard/6.2/proguard$pkgver.tar.gz)
sha1sums=('054382218b21bbb1345aac6b95340ff385e30899')

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
