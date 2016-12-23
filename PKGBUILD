# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.3.1
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

sha512sums=('6d5251d95cf373aa209769c4643885063a36039a8c6cb4e761e23ff5953c1f8f345caf8c07495f68206462e4f388b06761b981a1b2f89ee81def9dc3c3291cc2'
            '978fb07ab503eaf70a49b23ed8ae8df4f84202a31be8492eb985032d894849479e40d88ba845956a3788327622355ef5e42976c3910ace7788c56bafc45f460c'
            'bff226b57a82d7318062ed4f4fce8f62ed4f913c844d16995c4d84facb9e65ea8e29908db0075cb068798898f5dba28705e637eeaf5c70dde7cff38bc3a6ee66')
