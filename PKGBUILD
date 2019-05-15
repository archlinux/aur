# Maintainer: David Birks <david@tellus.space>

pkgname=marktext
pkgver=0.14.0
pkgrel=1
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://github.com/marktext/marktext'
license=('MIT')
conflicts=('marktext-bin' 'marktext-git')
depends=('gtk3' 'libxss' 'nss')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::http://github.com/marktext/marktext/archive/v$pkgver.tar.gz")
sha512sums=('11249a2b350a973dd4e35c6f1bedf61415c6e49e22f8e344a4e3f942244cfea5d587adfe7f472e26696ab7e91fc5f17337e6de5db32de2ced964dadd5907c003')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  yarn install
  yarn build:dir
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/lib"
  cp -r "build/linux-unpacked" "$pkgdir/usr/lib/$pkgname"

  # Symlink main binary
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file and icon
  install -D "resources/linux/marktext.desktop" "$pkgdir/usr/share/applications/marktext.desktop"
  install -D "resources/icons/icon.png" "$pkgdir/usr/share/pixmaps/marktext.png"
}
