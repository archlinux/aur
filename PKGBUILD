# Maintainer: Jochem Kuipers <jochem@localhost>
pkgname=vader-companion
pkgver=0.1.1
pkgrel=1
pkgdesc='Vader Companion — configure Flydigi Vader 4 Pro on Linux'
arch=('any')
url='https://github.com/JochemKuipers/flydigi-spacestation-linux'
license=('MIT')
depends=('python' 'python-evdev' 'pyside6' 'flydigi-vader4d')
makedepends=('python' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JochemKuipers/flydigi-spacestation-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('429e376fb16e7c8f76c60f947446fb7640514de2ef76cc5fbd138bbe29f5f4e8')

prepare() {
  ln -sfn "flydigi-spacestation-linux-$pkgver" "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python packaging/stage.py companion --out "$srcdir/stage-companion"
}

package() {
  cp -a "$srcdir/stage-companion/." "$pkgdir/"
}
