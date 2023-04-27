# Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>

pkgname=onedev
pkgver=8.1.3
pkgrel=1
_buildid=3597
arch=('x86_64')
depends=('java-runtime-headless>11.0.0' 'git>2.11.1' 'fontconfig' 'ttf-dejavu')
url="https://code.onedev.io/onedev/server"
license=('MIT' 'BSD' 'Apache' 'LGPL2.1' 'MPL2' 'custom:Oracle Technology Network License'
         'custom:Microsoft Software License' 'custom:Sun Microsystems Inc Binary Code License'
         'custom:Jetty License')
source=("https://code.onedev.io/~downloads/projects/160/builds/$_buildid/artifacts/onedev-$pkgver.tar.gz"
        "sysusers.conf"
        "onedev.service"
        "onedev-upgrade.sh")
sha256sums=('4949c75163bbcd32dd060ca31f4cf92d46a310b901b0c37d7a9f8a8d1f230f12'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            '56c7dea1e61cf81d6dddc34fa098fa5a7ed892b1d3e506cf003b0c2c71bb5866'
            '8d6a233e2f31d8012ac91046fa759f55a829aa403d78f89454d1ecd988e7bbf5')
install=onedev.install

package() {
  pkgdesc="A self-hosted Git server with CI/CD and Kanban"

  # Install PKGBUILD files
  install -D -m 0644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/onedev.conf"
  install -D -m 0644 onedev.service "$pkgdir/usr/lib/systemd/system/onedev.service"
  install -D -m 0755 onedev-upgrade.sh "$pkgdir/usr/bin/onedev-upgrade"

  # Install package contents
  cd $pkgname-$pkgver
  install -d "$pkgdir/opt/onedev-base"
  install -o 663 -g 663 -d "$pkgdir/opt/onedev"
  cp -r * "$pkgdir/opt/onedev-base"
  install -D -m 0644 "license.txt" "$pkgdir/usr/share/licenses/onedev/LICENSE"
  install -D -m 0644 "3rdparty-licenses/antlr-license.txt" "$pkgdir/usr/share/licenses/onedev/antlr/LICENSE"
  install -D -m 0644 "3rdparty-licenses/asm-license.txt" "$pkgdir/usr/share/licenses/onedev/asm/LICENSE"
  install -D -m 0644 "3rdparty-licenses/jetty-license.txt" "$pkgdir/usr/share/licenses/onedev/jetty/LICENSE"
  install -D -m 0644 "3rdparty-licenses/ojdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/ojdbc/LICENSE"
  install -D -m 0644 "3rdparty-licenses/slf4j-license.txt" "$pkgdir/usr/share/licenses/onedev/slf4j/LICENSE"
  install -D -m 0644 "3rdparty-licenses/sqljdbc-license.txt" "$pkgdir/usr/share/licenses/onedev/sqljdbc/LICENSE"
  install -D -m 0644 "3rdparty-licenses/sun-license.txt" "$pkgdir/usr/share/licenses/onedev/sun/LICENSE"
}
