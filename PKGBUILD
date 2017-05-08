# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.4.3
pkgrel=1
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby' 'git')
_mruby_sha1=bf4e79cc62af809138bc7db7e54ece67080b5fa8
source=("https://github.com/k0kubun/${pkgname}/archive/v${pkgver}.tar.gz"
        "mruby-${_mruby_sha1}.tar.gz::https://github.com/k0kubun/mruby/archive/${_mruby_sha1}.tar.gz"
        'build_config.rb'
        )

prepare() {
  cd "$pkgname-$pkgver"

  rmdir mruby
  tar xf "$srcdir/mruby-${_mruby_sha1}.tar.gz"
  mv "mruby-${_mruby_sha1}" mruby
}

build() {
  cd "$pkgname-$pkgver"

  cp "$srcdir/build_config.rb" .
  mruby/minirake compile
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 mruby/build/host/bin/mitamae "$pkgdir/usr/bin/"
  install -m755 mruby/build/host/bin/mitamae-secrets "$pkgdir/usr/bin/"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}

sha512sums=('aabe4144f0063a458790ed8d3423db0acf15f37f5772b9b481d1321d30200ae6c1a14601f4ba103935cd0ba93f10641759dff070313a50c690e3cf7f3b1c7625'
            '7423af432f366a9c1d7c5ca0c54ca7cb1afebeecf3d979df4f1fff53ce11d611332dbe578cea5a7f4362d183c1a6c8d431d6fd262fdc4d0fe298c1eb7d4757e9'
            'cf060f65baead3fb9df4b08f2630e749c768da280be77946c0b514cbc8864851dfd0651a6f63cc186cc28421afeca14a6c7a32585ac3dc121299cd5a7f8eb32d')
