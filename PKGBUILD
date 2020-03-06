# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=mitamae
pkgver=1.11.5
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
sha512sums=('69867ef9b3ace12ac12f1488201294fbcaeeb51124dda1c57b4a06b5dff0a8a180b19b87434c7a8a32651e9303e48b0c1312443c326e5182115bae0bf12f9973'
            '74403f928c5af52c615ee2490b0aa685b4d62238f3da3778b3e44748e523e1916f110b42f2e73729be24d561b89a9ae498ff32f549ebe241e97a70d83cf39ded'
            'a6168fc5931699842db003f7f3ad2b06c90eb465712709fd12b02f17ec24c9900cc70711fdb8086025318db97b32890e0771082b4c88afc8d867144e035d9512')
