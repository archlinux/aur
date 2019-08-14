# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=mitamae
pkgver=1.8.0
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby-rake' 'git')
_mruby_revision=2.0.1
source=("https://github.com/k0kubun/${pkgname}/archive/v${pkgver}.tar.gz"
        "mruby-${_mruby_revision}.tar.gz::https://github.com/mruby/mruby/archive/${_mruby_revision}.tar.gz"
        'build_config.rb'
        )

prepare() {
  cd "$pkgname-$pkgver"

  tar xf "$srcdir/mruby-${_mruby_revision}.tar.gz"
  mv "mruby-${_mruby_revision}" mruby
}

build() {
  cd "$pkgname-$pkgver"

  cp "$srcdir/build_config.rb" .
  rake compile
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 mruby/build/host/bin/mitamae "$pkgdir/usr/bin/"
  install -m755 mruby/build/host/bin/mitamae-secrets "$pkgdir/usr/bin/"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
sha512sums=('5fd70e9fa1224fe491ba8186752425d49e70befbb470c34d61415c00f5f07a93cdf38afce55c0395bfdbc80007461e2648aaa6d1f17ad4cf913f996f5407e60b'
            '74403f928c5af52c615ee2490b0aa685b4d62238f3da3778b3e44748e523e1916f110b42f2e73729be24d561b89a9ae498ff32f549ebe241e97a70d83cf39ded'
            '8dc2f04d2251e2568d4151e5362497687922560ec383795634a8cec7483858ff23943dcedff25391b95586e67247adbd1936168835df973d218450f68bb55802')
