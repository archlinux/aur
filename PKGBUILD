# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nsh-cli-bin
pkgver=0.6.1
pkgrel=2
pkgdesc='Build and run nsh apps (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/longbridge/nsh'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc>=2.35')
options=(!strip !debug)

_tag="v$pkgver"
source=("nsh-LICENSE-$pkgver::https://raw.githubusercontent.com/longbridge/nsh/v$pkgver/LICENSE-APACHE")
source_x86_64=("nsh-$pkgver-x86_64.tar.gz::$url/releases/download/$_tag/nsh-linux-x86_64.tar.gz")
source_aarch64=("nsh-$pkgver-aarch64.tar.gz::$url/releases/download/$_tag/nsh-linux-arm64.tar.gz")
sha256sums=('ec75427ad955e3c740f22e7dc3f6db6fc5b2cc1d9135c2af91cece8dd47a2d38')
sha256sums_x86_64=('9a7ac692f1c229df476be8ff83a3c5912d271453b644e313f02cb19d18696070')
sha256sums_aarch64=('d7d54b8a62aa8bd4a9fb73fcc0abce8cc565185926f226aa90f48622f3e410a3')

package() {
  cd "$srcdir/nsh"
  install -Dm755 bin/nsh "$pkgdir/usr/bin/nsh"
  install -dm755 "$pkgdir/usr/lib/nsh"
  cp -a runtime "$pkgdir/usr/lib/nsh/"
  install -Dm755 runtime/linux/nsh-linux-host "$pkgdir/usr/bin/nsh-linux-host"
  install -Dm755 runtime/linux/nsh-linux-app "$pkgdir/usr/bin/nsh-linux-app"
  install -Dm644 "$srcdir/nsh-LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
