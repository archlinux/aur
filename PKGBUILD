# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Isaac Mills <rooster0055 at protonmail dot com>

pkgname=dogehouse-bin
_name="${pkgname%-bin}"
pkgver=1.0.69
pkgrel=2
pkgdesc="Taking voice conversations to the moon (binary release)"
url="https://dogehouse.tv"
license=('MIT')
arch=('x86_64')
depends=('gtk3' 'nss' 'libnotify' 'libappindicator-gtk3')
provides=("$_name")
conflicts=("$_name")
source=("$pkgname-$pkgver.tar.gz::https://github.com/benawad/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz"
        "$_name.desktop"
        "$_name.png::https://raw.githubusercontent.com/benawad/$_name/v$pkgver/baklava/icons/icon.png"
        "https://raw.githubusercontent.com/benawad/$_name/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/benawad/$_name/v$pkgver/README.md")
sha256sums=('8fd5198c6c741ffbabf9c085a211b44a69e264d141a92ec7e593436caaec2cb7'
            '9ded0ca6897cf760910d2e55d95f598bdda53089d3223789c29802cf290c6b15'
            'c21c0cc98cfae54072a69a908cc453169d07fd40fb6d56e5b5be3849a19db0eb'
            'ea2731f9f2147ff697285ed456f1b8ee5c79d592ce6db48c4d1673591210c7ce'
            '13fe9e347643956984b99540f3165230ce7a635b225fc865d4015a0603258b38')

package() {
  cd "$_name-$pkgver"
  install -d "$pkgdir/opt/dogehouse/"
  cp -a . "$pkgdir/opt/dogehouse/"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/dogehouse/dogehouse "$pkgdir/usr/bin/dogehouse"

  cd "$srcdir"
  install -Dm 644 "$_name.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm 644 "$_name.png" -t "$pkgdir/usr/share/icons/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

