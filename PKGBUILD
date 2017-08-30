# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.5.1
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby' 'git')
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

sha512sums=('040b05b8fcd989c2d3eb0f0acb8bde004f41083d758955c72080ca7ed3d90ca85f8798c5aaa4f4c65f7cb190fedf01c9e0d2657520668887fdac435eff52981a'
            '13a57306706d2d60693151919ae15bb3621e6e7ed3b5e9c6d3b1c8d44e52b898c1ad394b39946d730ff82a19f5e3b7c2a374f9dcc3b6c6f990581e504f1cb9cb'
            'cf060f65baead3fb9df4b08f2630e749c768da280be77946c0b514cbc8864851dfd0651a6f63cc186cc28421afeca14a6c7a32585ac3dc121299cd5a7f8eb32d')
