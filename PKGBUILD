# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mojo-ide
pkgver=B1.3.6
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
sha512sums=("7d3af890e29225ccd47e9f8c5720f071fe10d7fc62e075812f061e4727c4fb0320f8349915fc07a3f0ec199b7f5ab3d518dcf6de92fe92670b979b5fa29066f5"
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
