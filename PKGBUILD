# Maintainer: Arnau Sanchez <pyarnau {at} gmail {dot} com>
# Contributor: ArchAssault <team {at} archassault {dot} org>
pkgname=js-beautify
pkgver=1.5.4
pkgrel=1
groups=('archassault' 'archassault-reversing')
pkgdesc="Beautify, unpack or deobfuscate JavaScript and HTML, make JSON/JSONP readable"
arch=('any')
url="https://github.com/beautify-web/js-beautify"
license=('MIT')
depends=('rhino' 'coffee-script')
makedepends=('npm')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('9b747a85e0a313845f11d5567a85d7e87e8fcc9a8042c7840bffe293af26fd1ee6a9b96d9cb183ef640ebffff14104672976a4c852a3864f095d063e8ea16ea9')

prepare() {
  cd $pkgname-$pkgver
  npm install
}

package() {
  # Install python directory to /usr/share/$pkgname
  cd $pkgname-$pkgver
  install -Dm644 package.json "$pkgdir/usr/share/$pkgname/package.json"
  cp -r --no-preserve=ownership node_modules "$pkgdir/usr/share/$pkgname/"
  cp -r --no-preserve=ownership js "$pkgdir/usr/share/$pkgname/"
  rm -rf "$pkgdir/usr/share/$pkgname/js/test"

  # Create a symlinks to the executables in /usr/bin
  install -dm755 "$pkgdir/usr/bin/"
  ln -s "/usr/share/$pkgname/js/bin/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/share/$pkgname/js/bin/css-beautify.js" "$pkgdir/usr/bin/css-beautify"
  ln -s "/usr/share/$pkgname/js/bin/html-beautify.js" "$pkgdir/usr/bin/html-beautify"

  # Install the README.md to /usr/share/doc/$pkgname
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install the LICENSE to /usr/share/licenses/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
