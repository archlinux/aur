# Maintainer: Ben Cooper <contactme at bengcooper dot co dot uk>
pkgname=onedev
pkgver=7.8.13
pkgrel=1
pkgdesc="A self-hosted Git server with CI/CD and Kanban"
arch=('x86_64')
url="https://code.onedev.io/onedev/server"
license=('MIT')
source=("https://code.onedev.io/~downloads/projects/160/builds/3207/artifacts/onedev-$pkgver.zip"
        "sysusers.conf"
        "onedev.service")
sha256sums=('cddcdf47d481d9ed0fa30433e55dbb95524c820123c58141db6526bb082466c7'
            'ed8573826c9c89d7a35e3f8b52d4de69c9377fc713b5227bf30f12a45f0c2c82'
            'b5c84783296f23287341ca36a62d64204b71285c42e040a788c8864b65d231e6')

build() {
  cd "$srcdir"
  unzip -f "onedev-$pkgver.zip"
}

package() {
  depends=('jre-openjdk-headless>11.0.0' 'git>2.11.1' 'curl')
  install -o 663 -g 663 -d "$pkgdir"/opt/onedev
  cp -r "$srcdir/$pkgname-$pkgver"/* "$pkgdir"/opt/onedev
  chown -R 663:663 "$pkgdir"/opt/onedev
  install -D -m 0644 sysusers.conf "$pkgdir"/usr/lib/sysusers.d/onedev.conf
  install -D -m 0644 onedev.service "$pkgdir"/usr/lib/systemd/system/onedev.service
}

# vim:set ts=2 sw=2 et:
