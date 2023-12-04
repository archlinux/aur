# Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>

pkgname=onedev
pkgver=9.3.0
pkgrel=1
_buildid=4343
pkgdesc="A self-hosted Git server with CI/CD and Kanban"
arch=('x86_64')
depends=('java-runtime-headless=17' 'git>2.11.1' 'fontconfig' 'ttf-dejavu')
url="https://code.onedev.io/onedev/server"
license=('custom:OneDev License' 'MIT')
source=("https://code.onedev.io/~downloads/projects/160/builds/$_buildid/artifacts/onedev-$pkgver.tar.gz"
        "sysusers.conf"
        "onedev.service"
        "onedev-upgrade.sh")
sha256sums=('dba508059f337210217017df8a8557da4058f886eaed7909e6060e91e25a782a'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            '56c7dea1e61cf81d6dddc34fa098fa5a7ed892b1d3e506cf003b0c2c71bb5866'
            '779eef381def984fed476f253e0cc0e140e379196f8ec2f1656942e1025951f1')
install=onedev.install

package() {
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
}
