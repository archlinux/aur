# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.5.0
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

sha256sums_x86_64=('44fbbb4f6d3561766dda2665280b01345cf04c5d851dbd4e804d6a8493401b8e')
sha256sums_aarch64=('4a971b30e24e99c66459eafee6fbaa68afbb5a9a278ec182c449fc2d9e036e2a')
sha256sums_armv7h=('2eba398d43495dfd12af63c58e5fb6612c5be75226b59c41586e435791bb0470')

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
