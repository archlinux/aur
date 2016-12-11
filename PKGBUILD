# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.1.2
pkgrel=2
pkgdesc="Configuration management tool embedding mruby"
arch=('i686' 'x86_64')
url="https://github.com/k0kubun/mitamae"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('ruby' 'git')
source=("https://github.com/k0kubun/${pkgname}/archive/v${pkgver}.tar.gz"
        'build_config.rb')

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

sha512sums=('57d2c4fe093ee729e8d35799dcafc1b5ea92e34dd7a3ab17e3f2ce0fef612368d3b5d09f2a9d18891fc52ff24ae18ff755b4ff8319bcd0ba534b436cd78df893'
            '8910ff0a465e821021de68713161c0a43ad6344a868430c6b8c1384ab1d50980968bedc3feb26cdb48556e318015784e9c11325495184da5358aa61143b0e4aa')
