# Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>
# Co-Maintainer: Polarian <polarian@polarian.dev>
_projectid=160
_buildid=3416
pkgname=('onedev' 'onedev-new')
pkgbase=onedev
pkgver=7.9.12
pkgrel=1
arch=('x86_64')
depends=('java-runtime-headless>11.0.0' 'git>2.11.1' 'curl' 'fontconfig' 'ttf-dejavu')
makedepends=('gzip' 'tar' 'java-environment-openjdk=11')
url="https://code.onedev.io/onedev/server"
license=('MIT' 'BSD' 'Apache' 'LGPL2.1' 'MPL2' 'custom:Oracle Technology Network License'
         'custom:Microsoft Software License' 'custom:Sun Microsystems Inc Binary Code License'
         'custom:Jetty License')
source=("https://code.onedev.io/~downloads/projects/$_projectid/builds/$_buildid/artifacts/onedev-$pkgver.tar.gz"
        "sysusers.conf"
        "onedev.service")
sha256sums=('50fd46f0e100f57ef5d37a1bf38b36c63db0e9dd5bd4e4c4c8ebb4186cb5b152'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            '56c7dea1e61cf81d6dddc34fa098fa5a7ed892b1d3e506cf003b0c2c71bb5866')
backup=(opt/onedev/conf/hibernate.properties
        opt/onedev/conf/logback.xml
        opt/onedev/conf/server.properties
        opt/onedev/conf/wrapper.conf
        opt/onedev/conf/wrapper-license.conf)

build() {
  cd "$srcdir"
  tar -xvzf "onedev-$pkgver.tar.gz"
}

package_onedev() {
  pkgdesc="A self-hosted Git server with CI/CD and Kanban"

  install -D -m 0644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/onedev.conf"
  install -D -m 0644 onedev.service "$pkgdir/usr/lib/systemd/system/onedev.service"
  install -o 663 -g 663 -d "$pkgdir/opt/onedev"
  cp -r "$srcdir/$pkgbase-$pkgver"/* "$pkgdir/opt/onedev"
  chown -R 663:663 "$pkgdir/opt/onedev"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/license.txt" "$pkgdir/usr/share/licenses/onedev/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/onedev/antlr/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/onedev/asm/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/onedev/jetty/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/ojdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/onedev/slf4j/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/sqljdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/onedev/sun/LICENSE"
}

package_onedev-new() {
  pkgdesc="Latest version of onedev, installed to a different directory, used to update onedev"

  install -o 663 -g 663 -d "$pkgdir/opt/onedev-new"
  cp -r "$srcdir/$pkgbase-$pkgver"/* "$pkgdir/opt/onedev-new"
  chown -R 663:663 "$pkgdir/opt/onedev-new"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/$pkgname/antlr/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/$pkgname/asm/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/$pkgname/jetty/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/ojdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/$pkgname/slf4j/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/sqljdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgbase-$pkgver/3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/$pkgname/sun/LICENSE"
}

pre_upgrade() {
  exec "$pkgdir/opt/onedev/bin/upgrade.sh /opt/onedev"
}

# vim:set ts=2 sw=2 et:
