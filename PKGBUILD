#Maintainer: KlarkKable <KlarkKable at protonmail dot com>
pkgname=dart-sdk-dev
pkgver=2.13.0_204.0.dev
pkgrel=1
pkgdesc="The official Dart sdk from dart-lang project (Development branch)"
arch=('x86_64')
url="https://www.dartlang.org/tools/sdk/archive"
license=('custom')
depends=('unzip')
conflicts=('dart')
provides=('dart=$pkgver')
source=(dartsdk-linux-x64-release-${pkgver}.zip::"https://storage.googleapis.com/dart-archive/channels/dev/release/${pkgver//_/-}/sdk/dartsdk-linux-x64-release.zip")
sha256sums=('834fa9111c08fb17b1b76c5c565f14792fac2a9cdf5691a83d66850b993a5c03')

package() {
  # Uncompressed name is "dart-sdk" not "dart-sdk-dev"
  cd $srcdir/dart-sdk

  # Install Application
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a . $pkgdir/opt/$pkgname
  for f in "$pkgdir"/opt/$pkgname/bin/*; do
    ln -s /opt/$pkgname/bin/${f##*/} "$pkgdir"/usr/bin/
  done

  chmod -R ugo+rX $pkgdir/opt
}
