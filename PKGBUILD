# Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>
pkgname=onedev
pkgver=7.9.3
pkgrel=1
pkgdesc="A self-hosted Git server with CI/CD and Kanban"
arch=('x86_64')
url="https://code.onedev.io/onedev/server"
license=('MIT' 'BSD' 'Apache' 'LGPL2.1' 'MPL2' 'custom:Oracle Technology Network License'
         'custom:Microsoft Software License' 'custom:Sun Microsystems Inc Binary Code License'
         'custom:Jetty License')
source=("https://code.onedev.io/~downloads/projects/160/builds/3266/artifacts/onedev-$pkgver.zip"
        "sysusers.conf"
        "onedev.service")
sha256sums=('63914197be2b48b21f548637bf43dd6a3c70302e2a2e1075a2e538d978e58fcc'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            'b5c84783296f23287341ca36a62d64204b71285c42e040a788c8864b65d231e6')
backup=(opt/onedev/conf/hibernate.properties
        opt/onedev/conf/logback.xml
        opt/onedev/conf/server.properties
        opt/onedev/conf/wrapper.conf
        opt/onedev/conf/wrapper-license.conf)

build() {
  cd "$srcdir"
  unzip -f "onedev-$pkgver.zip"
}

package() {
  depends=('java-runtime-headless>11.0.0' 'git>2.11.1' 'curl' 'fontconfig' 'ttf-dejavu')
  install -o 663 -g 663 -d "$pkgdir/opt/onedev"
  cp -r "$srcdir/$pkgname-$pkgver"/* "$pkgdir/opt/onedev"
  chown -R 663:663 "$pkgdir/opt/onedev"
  install -D -m 0644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/onedev.conf"
  install -D -m 0644 onedev.service "$pkgdir/usr/lib/systemd/system/onedev.service"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/license.txt" "$pkgdir/usr/share/licenses/onedev/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/onedev/antlr/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/onedev/asm/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/onedev/jetty/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/ojdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/onedev/slf4j/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/sqljdbc/LICENSE"
  install -D -m 0644 "$srcdir/$pkgname-$pkgver/3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/onedev/sun/LICENSE"
}

# vim:set ts=2 sw=2 et:
