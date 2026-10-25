# Maintainer: Jochem Kuipers <jochem@localhost>
pkgname=vader-companion
pkgver=0.1.3
pkgrel=1
pkgdesc='Vader Companion — configure Flydigi Vader 4 Pro on Linux'
arch=('any')
url='https://github.com/JochemKuipers/flydigi-spacestation-linux'
license=('MIT')
depends=('python' 'python-evdev' 'pyside6' 'flydigi-vader4d')
makedepends=('python' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JochemKuipers/flydigi-spacestation-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8593ada2921411eae99346b351d071b5fcf53717a964df9dd87054c1d86b98ac')

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
