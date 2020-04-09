# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.13.0
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

source_x86_64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
source_aarch64=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm64v8.tar.gz")
source_armv7h=("https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-arm32v7.tar.gz")

sha256sums_x86_64=('ed866c99fb208485ce569b7f391e3e175fc7c6e44fe7afdfe063fe63a9c4f334')
sha256sums_aarch64=('0ad2ae41b1c2bd5c9dc81a755be4c9465a3fa198a42ce741c0849e8821c4891c')
sha256sums_armv7h=('bb3575ca9ad9d30b8bd0e4d5e518309d391264960ab9cd9008aea865d2b98cb4')

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
  install -dm655 "$pkgdir/usr/share/webapps/$_pkgname"
  cp -r "$srcdir/public_html/." "$pkgdir/usr/share/webapps/$_pkgname/"
}
