# Maintainer: Polarian <polarian@polarian.dev>
# Co-Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>

_projectid=160
_buildid=3502
_pkgname=onedev
pkgname=('onedev-bin' 'onedev-new-bin')
pkgbase=onedev-bin
pkgver=8.0.9
pkgrel=2
arch=('x86_64')
depends=('java-runtime-headless>11.0.0' 'git>2.11.1' 'fontconfig' 'ttf-dejavu')
url="https://code.onedev.io/onedev/server"
license=('MIT' 'BSD' 'Apache' 'LGPL2.1' 'MPL2' 'custom:Oracle Technology Network License'
         'custom:Microsoft Software License' 'custom:Sun Microsystems Inc Binary Code License'
         'custom:Jetty License')
source=("https://code.onedev.io/~downloads/projects/$_projectid/builds/$_buildid/artifacts/onedev-$pkgver.tar.gz"
        "sysusers.conf"
        "onedev.service")
sha256sums=('31772da0c61cbac7d9b1a1d5dc1e0a654850a7b3d7d6bd4ce4665c49265e9f55'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            '56c7dea1e61cf81d6dddc34fa098fa5a7ed892b1d3e506cf003b0c2c71bb5866')
backup=(opt/onedev/conf/hibernate.properties
        opt/onedev/conf/logback.xml
        opt/onedev/conf/server.properties
        opt/onedev/conf/wrapper.conf
        opt/onedev/conf/wrapper-license.conf)

package_onedev-bin() {
  pkgdesc="A self-hosted Git server with CI/CD and Kanban"

  # Install pkgbuild files
  install -D -m 0644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/onedev.conf"
  install -D -m 0644 onedev.service "$pkgdir/usr/lib/systemd/system/onedev.service"
  
  # Install package contents
  cd $_pkgname-$pkgver
  install -o 663 -g 663 -d "$pkgdir/opt/$_pkgname"
  cp -r * "$pkgdir/opt/$_pkgname"
  chown -R 663:663 "$pkgdir/opt/$_pkgname"
  install -D -m 0644 "license.txt" "$pkgdir/usr/share/licenses/onedev/LICENSE"
  install -D -m 0644 "3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/onedev/antlr/LICENSE"
  install -D -m 0644 "3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/onedev/asm/LICENSE"
  install -D -m 0644 "3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/onedev/jetty/LICENSE"
  install -D -m 0644 "3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/ojdbc/LICENSE"
  install -D -m 0644 "3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/onedev/slf4j/LICENSE"
  install -D -m 0644 "3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/sqljdbc/LICENSE"
  install -D -m 0644 "3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/onedev/sun/LICENSE"
}

package_onedev-new-bin() {
  pkgdesc="Latest version of onedev, installed to a different directory, used to update onedev"
  cd $_pkgname-$pkgver

  # Install only the contents of the package, as the -new package is used for updating the main package
  install -o 663 -g 663 -d "$pkgdir/opt/$_pkgname-new"
  cp -r * "$pkgdir/opt/$_pkgname-new"
  chown -R 663:663 "$pkgdir/opt/$_pkgname-new"
  install -D -m 0644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 0644 "3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/$pkgname/antlr/LICENSE"
  install -D -m 0644 "3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/$pkgname/asm/LICENSE"
  install -D -m 0644 "3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/$pkgname/jetty/LICENSE"
  install -D -m 0644 "3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/ojdbc/LICENSE"
  install -D -m 0644 "3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/$pkgname/slf4j/LICENSE"
  install -D -m 0644 "3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/sqljdbc/LICENSE"
  install -D -m 0644 "3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/$pkgname/sun/LICENSE"
}

# vim:set ts=2 sw=2 et:
