# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=mojo-loader
pkgver=1.2.1
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
sha512sums=("4f8365144307eba874c7aaf6cacd1a70de9fb78a18e8ecf9c1b0aa196e1ecb7d0ae66026f32be0826170e6991857569bf57c4f5bfb21ceaadaad53b633e16533"
            "f578a3bbcf35924b3cbd529f7f0f8a99db1ae6247e2394cb3b1c12758733f6c85e79625cac645cfa0604b2af914636b4147944764cc2140663d22db1c0241cec"
            "7f715b90e1b6057bb1c5df68f3ce8660f3000f7277139e482bd09b67dc3e18391f09be522aefd1c467057735d9dfdaf03e54c54e63d7b52b43eba22540fd1db8")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 "driver/99-mojo.rules" "$pkgdir/usr/lib/udev/rules.d/99-mojo.rules"

  install -Dm 755 "$srcdir/run-mojo-loader.sh" "$pkgdir/usr/bin/mojo-loader"
  install -Dm 644 "$srcdir/mojo-loader.desktop" "$pkgdir/usr/share/applications/mojo-loader.desktop"

  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/$pkgname-$pkgver/" "$pkgdir/opt/"
  mv "$pkgdir/opt/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
}
