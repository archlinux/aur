# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.3.3
pkgrel=1
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

sha512sums=('bde264647434ffd7e35d4b941a4b6e55b7ff044b68d13b2b5e4d20cbb05b09ae3f716661a4caff3b4767315626aff252335009b6fc462bab6ef8c98f2905ea76'
            '978fb07ab503eaf70a49b23ed8ae8df4f84202a31be8492eb985032d894849479e40d88ba845956a3788327622355ef5e42976c3910ace7788c56bafc45f460c'
            '71151af824b66dbbf2e76451ea15730045a0d51ccac8fbc238a07c71ddfd0d93865190e8e16879893e14245e941a73cc78bc8a4eb90966dec025a1b8dfa45214')
