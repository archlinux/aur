# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geanypad
pkgver=25.07
pkgrel=1
pkgdesc="Configuration files for using Geany as a simple text editor"
arch=('any')
url="https://teejeetech.com//tags/geany"
license=('GPL-2.0-or-later')
depends=(
  'geany'
  'geany-plugins'
  'rsync'
)
optdepends=(
  'ttf-firacode: default editor font'
  'ttf-ubuntu-font-family: default tagbar & msgwin font'
)
source=("https://packages.teejeetech.com/public/deb/${pkgname}_${pkgver}_all.deb")
sha256sums=('bd3158e477ce5d69bde48a3a59e1ed14e3ed2529cf863ca0840104f5a07d5f2f')

package() {
  bsdtar -xvf data.tar.zst -C "$pkgdir/"

  ln -svf /usr/bin/geany "$pkgdir/usr/bin/$pkgname-bin"

  # Only install color schemes not already included with geany
  for color in $(ls /usr/share/geany/colorschemes/); do
    rm -rfv "$pkgdir/usr/share/geany/colorschemes/${color}"
  done
}
