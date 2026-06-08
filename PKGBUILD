# Maintainer: Boteium <Boteium@users.noreply.github.com>
pkgname=vautoshiftd-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Virtual AutoShift daemon for providing QMK-style hold-to-shift feature on regular keyboards"
arch=('x86_64' 'aarch64')
url="https://github.com/Boteium/vautoshiftd"
license=('Apache-2.0')
depends=('systemd')
options=('!debug')
install=vautoshiftd-bin.install
source_x86_64=("$url/releases/download/v$pkgver/vautoshiftd-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/vautoshiftd-v$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('3584bc1e969704838e212e06d0dd70e9f0d4e38dbed6200dd920a51bb40acc6b')
sha256sums_aarch64=('6e00ded6074faa9d9cffdf2539f1129f6d5a1dacf5547235997974a43f5420dc')
backup=('etc/default/vautoshiftd')

package() {
  case $CARCH in
    x86_64)  _arch=amd64 ;;
    aarch64) _arch=aarch64 ;;
  esac

  cd "vautoshiftd-v$pkgver-linux-$_arch"

  install -dm755 "$pkgdir/usr/lib/vautoshiftd"
  install -m755 vautoshiftd "$pkgdir/usr/lib/vautoshiftd/vautoshiftd"

  install -dm755 "$pkgdir/usr/lib/systemd/system"
  install -m644 vautoshiftd.service "$pkgdir/usr/lib/systemd/system/vautoshiftd.service"

  install -dm755 "$pkgdir/etc/default"
  install -m644 etc/default/vautoshiftd "$pkgdir/etc/default/vautoshiftd"
}
