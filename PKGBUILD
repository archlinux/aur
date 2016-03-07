# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mojo-loader
pkgver=1.2.2
pkgrel=1
pkgdesc="Mojo Loader"
arch=('x86_64')
url="https://embeddedmicro.com/"
license=('unknown')
groups=()
depends=('java-environment' 'sh' 'bash')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://embeddedmicro.com/media/wysiwyg/mojo-loader/$pkgname-$pkgver-linux64.tgz"
        "mojo-loader.desktop"
        "run-mojo-loader.sh")
sha512sums=("e26988ad81fcf6831d99e3e0d07d872bfe90a9eb223b0e37ec64412ba5fd6a0266c37f1b64a83cef3f81f312df1bc6fb4a624b483090447c4095bd07b5fea880"
            "f578a3bbcf35924b3cbd529f7f0f8a99db1ae6247e2394cb3b1c12758733f6c85e79625cac645cfa0604b2af914636b4147944764cc2140663d22db1c0241cec"
            "7f715b90e1b6057bb1c5df68f3ce8660f3000f7277139e482bd09b67dc3e18391f09be522aefd1c467057735d9dfdaf03e54c54e63d7b52b43eba22540fd1db8")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ ! -f "/usr/lib/udev/rules.d/99-mojo.rules" ]; then
    install -Dm 644 "driver/99-mojo.rules" "$pkgdir/usr/lib/udev/rules.d/99-mojo.rules"
  fi

  install -Dm 755 "$srcdir/run-mojo-loader.sh" "$pkgdir/usr/bin/mojo-loader"
  install -Dm 644 "$srcdir/mojo-loader.desktop" "$pkgdir/usr/share/applications/mojo-loader.desktop"

  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/$pkgname-$pkgver/" "$pkgdir/opt/"
  mv "$pkgdir/opt/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
}
