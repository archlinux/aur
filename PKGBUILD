# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.5.6
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby-rake' 'git')
_mruby_revision=1.3.0
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

sha512sums=('b55721a7f5b8c8421af49d82a455580ca452d4559d8f56ba7e613707bae1c5227c4eda47f3eb76c657dd91b7925978e3c4277fc38d525e26fb5efd1854d19bff'
            '13a57306706d2d60693151919ae15bb3621e6e7ed3b5e9c6d3b1c8d44e52b898c1ad394b39946d730ff82a19f5e3b7c2a374f9dcc3b6c6f990581e504f1cb9cb'
            'b68c111f31d97f4ce4932ab84ac4ad150db0e1046ccfca8a2091e452e43bb23ded0184d2dbf36dd422d4266890d9f89c7ad4f09a1b8b4ca020eb1540949e3ecf')
