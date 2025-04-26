# Maintainer: tarball <bootctl@gmail.com>

pkgbase=ttf-iosevka-low
pkgname=(
  "$pkgbase"
  "$pkgbase-slab"
)
pkgver=33.2.1
pkgrel=1
pkgdesc='Custom build of Iosevka with lower line height (1.1 rem)'
arch=('any')
url='https://typeof.net/Iosevka'
license=('OFL-1.1')
makedepends=('nodejs' 'npm' 'ttfautohint')
source=("$pkgname-$pkgver.zip::https://github.com/be5invis/Iosevka/archive/refs/tags/v$pkgver.tar.gz"
        "private-build-plans.toml")
sha256sums=('b9a209c8a393ff15364003f2b6adf4018d1e4cf005981aa56a69f51bcb316c12'
            '2490dffd783e88ffd57689cb0f39eccfc58d916a757bbf0222aa1dfd9f121770')

prepare() {
  cd "$srcdir/Iosevka-$pkgver"
  npm install
  cp ../private-build-plans.toml .
}

build() {
  cd "$srcdir/Iosevka-$pkgver"
  npm run build -- ttf::IosevkaLow{,Slab}
}

_package() {
  cd "$srcdir/Iosevka-$pkgver"
  install -Dvm644 "dist/IosevkaLow$1/TTF"/*.ttf -t "$pkgdir/usr/share/fonts/IosevkaLow$1/"
  install -Dvm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ttf-iosevka-low() {
  _package ''
}

package_ttf-iosevka-low-slab() {
  _package Slab
}
