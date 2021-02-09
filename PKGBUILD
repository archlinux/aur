# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=mitamae
pkgver=1.12.0
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby-rake' 'git')
_mruby_revision=2.1.2
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
sha512sums=('03cc824b04dc4f94b9eca56ae523c1a9be1fabbbb2c0b5caef776f782ccab802f68db24522ac202d8697b4f485d6016be3a4a6666f8d95a1cf5ab6a765151718'
            'cbbb23dccda9d85ba6501d4dc94f634865b1a4c26f6a474468b09d5af54e9744c0d4b93454e20de3f8c7560e6c3dc6709bc34882dd16e25bd86abf710491575e'
            '47f8cbe495a1a4f74207f41fc1000d50785516cf589d49d61a9f054c7315a037bb6e50c8c926949a51dd35677d1f109d0f2a396e13b19448e4f3a6a4281dc15e')
