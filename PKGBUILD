# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=papirus-linux-universe
pkgver=1.0.0
pkgrel=1
pkgdesc="Papirus folder icon set based on distros and the most famous icon themes in the Linux world!"
arch=('any')
url="https://www.pling.com/p/1493085"
license=('GPL2')
depends=('bash' 'papirus-icon-theme')
optdepends=('papirus-nord: additional icon themes')
provides=('papirus-folders')
conflicts=('papirus-folders')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Adapta-Projects/Papirus-Linux-Universe/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2e8764a1eee5aaba97471d85c320238659f7cb74577454eb20c91dcca18b038a')

package() {
  cd Papirus-Linux-Universe-$pkgver
  install -Dm755 papirus-folders "$pkgdir/usr/bin/papirus-folders"
  install -Dm755 papirus-folders1 "$pkgdir/usr/bin/papirus-folders-nord"

  for i in 22 24 32 48 64; do

    # Remove conflicting icons provided by papirus-icon-theme
    rm Icons/${i}x${i}/*breeze*

    install -d "$pkgdir/usr/share/icons/Papirus/${i}x${i}/places"
    cp -r Icons/${i}x${i}/* "$pkgdir/usr/share/icons/Papirus/${i}x${i}/places"
  done
}
