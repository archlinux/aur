# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.2.4
pkgrel=2
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('openssl' 'pacman')
makedepends=('ruby' 'git')
_mruby_sha1=9cef2654025e6646b1d0ff259086fc9eb02fff84
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

sha512sums=('ae6ea8c815bef27bece1a87c8fb017cd271065edc764879a0a6bdb75c5f75156eed8f0971ccac5ff0356ec973cfc09958fe260b756f21fb4b50ff939d5cce805'
            '978fb07ab503eaf70a49b23ed8ae8df4f84202a31be8492eb985032d894849479e40d88ba845956a3788327622355ef5e42976c3910ace7788c56bafc45f460c'
            'd7f39b98df5a66dc77b9d4a8b979fda8c6291250454378c9ddfd519aff0994a5490f404756b13a603aa7d36c82219d670ed88334c57699daaff861d4c3fe677f')
