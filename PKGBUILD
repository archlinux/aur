# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.34.6
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

sha256sums_x86_64=('8dd94afe5cba5c504e36167b19cc43956a756c6ccc2a04921a1166759afe7571')
sha256sums_aarch64=('ac3feeb0721dd9c5a5a9124e6d908e3a8f84e152dcca448c20b523f4fae6110f')
sha256sums_armv7h=('752ae4d38daea7c35d2e0ddd67687c910dfe21ba040c3976ce961757e94986b4')

package() {
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm700 "$srcdir/config.template.yml" "$pkgdir/etc/$_pkgname/configuration.yml"
  if [[ $CARCH == 'x86_64' ]]; then
    install -Dm755 "$srcdir/$_pkgname-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
  elif [[ $CARCH == 'aarch64' ]]; then
    install -Dm755 "$srcdir/$_pkgname-linux-arm64" "$pkgdir/usr/bin/$_pkgname"
  else
    install -Dm755 "$srcdir/$_pkgname-linux-arm" "$pkgdir/usr/bin/$_pkgname"
  fi
}
