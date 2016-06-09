# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mojo-ide
pkgver=B1.3.2
pkgrel=1
pkgdesc="The IDE for Mojo"
arch=('x86_64')
url="https://embeddedmicro.com/"
license=('unknown')
groups=()
depends=('java-environment' 'sh' 'bash')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://embeddedmicro.com/ide/$pkgname-$pkgver-linux64.tgz"
        "mojo-ide.desktop"
        "run-mojo-ide.sh")
sha512sums=("007fbdb8a5a444fe41f73272d78918ef5638de72464a98d48fa9e9ad5f0b3e4d07af199204ad11bcead743cda9b4d26390d601c3947f0dddf7528222f88108fa"
            "ed041393bd96b6522a43ddc90877d9fcd6f9ebce0ea5271746508d2d7434a8d8cadf267f589d034f85edabe2d108a86fd953b9a401fd2b026aeaa85c4c5db006"
            "80aa2594e159fdee6f765ca0394a9f811664bc620c123601dc2d4b1f40c0786d40137ebe360a74eae398556803d492ef40b1cb037cbd0e83c31e0d3a21c6e200")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ ! -f "/usr/lib/udev/rules.d/99-mojo.rules" ]; then
    install -Dm 644 "driver/99-mojo.rules" "$pkgdir/usr/lib/udev/rules.d/99-mojo.rules"
  fi

  install -Dm 755 "$srcdir/run-mojo-ide.sh" "$pkgdir/usr/bin/mojo-ide"
  install -Dm 644 "$srcdir/mojo-ide.desktop" "$pkgdir/usr/share/applications/mojo-ide.desktop"

  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/$pkgname-$pkgver/" "$pkgdir/opt/"
  mv "$pkgdir/opt/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
}
