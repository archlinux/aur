# Maintainer: Frederick Zhang <frederick888@tsundere.moe>

pkgname=tad-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Desktop application for viewing and analyzing tabular data such as CSV files"
arch=("x86_64")
depends=("openssl-1.1")
url="https://www.tadviewer.com/"
license=("MIT")
source=(
  "https://github.com/antonycourtney/tad/releases/download/v${pkgver}/tad_${pkgver}_amd64.deb"
  "tad"
  "LICENSE"
)
sha256sums=('c929e03157c26ab545322ba715a003e796ce644eb53bfd46009757e214078e77'
            '49bcc24cee42880c79e6a0809b0831ab5453edc4517477853974961ffd033294'
            'a242ac627b07bec45c06620e20a5d046b6b31433cdf0a8011da35760b9a54b0e')

prepare() {
  tar -xf data.tar.xz
}

package() {
  install -Dm644 "$srcdir/usr/share/applications/tad.desktop" "$pkgdir/usr/share/applications/tad.desktop"
  install -Dm644 "$srcdir/usr/share/doc/tad/changelog.gz" "$pkgdir/usr/share/doc/tad/changelog.gz"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  cp -r "$srcdir/usr/share/icons/hicolor" "$pkgdir/usr/share/icons/"
  install -dm755 "$pkgdir/opt"
  cp -r "$srcdir/opt/Tad" "$pkgdir/opt/"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/tad" "$pkgdir/usr/bin/tad"
}

# vim: set tabstop=4 shiftwidth=2 expandtab:
