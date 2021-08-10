# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.30.3
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
source_aarch64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64v8.tar.gz")
source_armv7h=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm32v7.tar.gz")

sha256sums_x86_64=('4c6dea3677768acabb17987fc9ba396cd3558f5f429ab9cab6a91c6cdda1ccde')
sha256sums_aarch64=('2e0db6b31a1a8aaf003d36b47c4c97f3e572750953d94d7a6aa3ef91f9343ad2')
sha256sums_armv7h=('66fe2d8e899a32df6ebc0877c1f50650c099d94086ffffb71bc8119ec18afb4e')

package() {
  install -Dm644 "$srcdir/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm700 "$srcdir/config.template.yml" "$pkgdir/etc/$_pkgname/configuration.yml"
  if [[ $CARCH == 'x86_64' ]]; then
    install -Dm755 "$srcdir/$_pkgname-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
  elif [[ $CARCH == 'aarch64' ]]; then
    install -Dm755 "$srcdir/$_pkgname-linux-arm64v8" "$pkgdir/usr/bin/$_pkgname"
  else
    install -Dm755 "$srcdir/$_pkgname-linux-arm32v7" "$pkgdir/usr/bin/$_pkgname"
  fi
}
