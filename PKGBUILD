# Maintainer: David Birks <david@tellus.space>

pkgname=marktext
pkgver=0.14.0
pkgrel=2
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://github.com/marktext/marktext'
license=('MIT')
conflicts=('marktext-bin' 'marktext-git')
depends=('electron')
makedepends=('nodejs' 'yarn' 'npm' 'python2' 'libxkbfile' 'git')
source=("$pkgname-$pkgver.tar.gz::http://github.com/marktext/marktext/archive/v$pkgver.tar.gz"
        'marktext.sh')
sha512sums=('11249a2b350a973dd4e35c6f1bedf61415c6e49e22f8e344a4e3f942244cfea5d587adfe7f472e26696ab7e91fc5f17337e6de5db32de2ced964dadd5907c003'
            '8927cea6815420206982263d80fa54bbcfcc37623008b6a2f25d16782cfdff70ef44c3dbc142e2c45b474df52f216e7d58cf556a525df0683bc447481ab7b27d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  yarn install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  yarn build:dir
}

package() {
  # Install app.asar and launcher script
  install -D "$srcdir/$pkgname-$pkgver/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/share/marktext/app.asar"
  install -D "$srcdir/marktext.sh" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file and icon
  install -D "$srcdir/$pkgname-$pkgver/resources/linux/marktext.desktop" "$pkgdir/usr/share/applications/marktext.desktop"
  install -D "$srcdir/$pkgname-$pkgver/resources/icons/icon.png" "$pkgdir/usr/share/pixmaps/marktext.png"
}
