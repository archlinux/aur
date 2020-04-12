# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=mitamae
pkgver=1.11.7
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64' 'aarch64')
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
sha512sums=('31acabb5e115fa6b576f54cc4ccb198b3c98dfc27d6313727fe3aeb4cb454edff6380ec05190afb50f95a7b8fa64e3002dd8047e93712510ef09f6f5f0838356'
            '74403f928c5af52c615ee2490b0aa685b4d62238f3da3778b3e44748e523e1916f110b42f2e73729be24d561b89a9ae498ff32f549ebe241e97a70d83cf39ded'
            '47f8cbe495a1a4f74207f41fc1000d50785516cf589d49d61a9f054c7315a037bb6e50c8c926949a51dd35677d1f109d0f2a396e13b19448e4f3a6a4281dc15e')
