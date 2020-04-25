# Maintainer: Amir Zarrinkafsh <nightah at me dot com>
pkgname=authelia-bin
_pkgname=authelia
pkgver=4.15.1
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

sha256sums_x86_64=('e9b98bee49824e16c18be3fbbc55367b6e7fb22a3546f4f99fc96d463c464081')
sha256sums_aarch64=('1c78f2d4006e810678724daaa61998a5dae9672bac588d0f79183e2e26a6162d')
sha256sums_armv7h=('decf76fd69d7a6dba188443136d6f15b0448102b65e0441c4158d50e88e80030')

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
