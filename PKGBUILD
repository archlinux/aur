# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.30.2
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

sha256sums_x86_64=('e95c10d54cf99921808af770295bcce5f15af1a6579919e5378e04273eedbc4d')
sha256sums_aarch64=('ebf6c671d883057d2c9fa7db36e52afc5c0e0a4451fd34b806abcbd62bef424b')
sha256sums_armv7h=('34f6703858aaa63618af06a822644bea48a1090e3969a4a6d7996938b24db6f0')

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
