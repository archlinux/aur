# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

_version=$(curl -L -H "Accept: application/vnd.github+json" "https://api.github.com/repos/lf-lang/epoch/releases/tags/nightly" 2>&1 | grep '"name":' | grep "linux" | cut -d'_' -f3 | cut -d'-' -f1)

pkgname=epoch-nightly-bin
pkgver=202402010502
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'perl')
conflicts=('epoch-bin')

source=("https://github.com/lf-lang/epoch/releases/download/nightly/epoch_ide_${_version}-linux.gtk.${CARCH}.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/epoch/main/LICENSE")
sha512sums=('SKIP' 'SKIP')

pkgver() {
    echo "$_version"
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch/LICENSE"

  install -dm755 "${pkgdir}/usr/share/java/epoch"
  cp -r "${srcdir}/epoch" "${pkgdir}/usr/share/java"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/epoch/epoch" "${pkgdir}/usr/bin/epoch"
  install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
}
