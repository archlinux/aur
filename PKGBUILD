# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.39.5
pkgrel=1
pkgdesc="The Cloud ready multi-factor authentication portal for your Apps. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/authelia/authelia"
license=('Apache-2.0')
provides=('authelia')
conflicts=(
  'authelia'
  'authelia-git'
)
backup=('etc/authelia/configuration.yml')

source_x86_64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.tar.gz")
source_armv7h=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm.tar.gz")

sha256sums_x86_64=('8d1379faef7ab3bb7795f6acbff835aa4f2102208d94881f3faac5df40bcb55e')
sha256sums_aarch64=('331f1dde4b586325e4187aa9f2b22732de3ab835dd90bc8e45ae6d54ea3f8a81')
sha256sums_armv7h=('50e47c36e8f7736d7ae3ae8f628fbaff509524512ae6dd802ce9d26be5bdbf44')

package() {
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$srcdir/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
  install -Dm644 "$srcdir/$_pkgname.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles.config.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname-config.conf"
  install -Dm440 "$srcdir/config.template.yml" "$pkgdir/etc/$_pkgname/configuration.yml"
  if [[ $CARCH == 'x86_64' ]]; then
    install -Dm755 "$srcdir/$_pkgname-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
  elif [[ $CARCH == 'aarch64' ]]; then
    install -Dm755 "$srcdir/$_pkgname-linux-arm64" "$pkgdir/usr/bin/$_pkgname"
  else
    install -Dm755 "$srcdir/$_pkgname-linux-arm" "$pkgdir/usr/bin/$_pkgname"
  fi
}
