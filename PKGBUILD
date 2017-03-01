# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.4.2
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

sha512sums=('b1e98ce9ee2efedc6e835eb8b8de3f09c2282d26506313ea15e3fe8c07e0a3bc0e8ba06f958b5a9726c52d34e18571255ba9d21d810d67b2a9bb1f28a1d4484f'
            '7423af432f366a9c1d7c5ca0c54ca7cb1afebeecf3d979df4f1fff53ce11d611332dbe578cea5a7f4362d183c1a6c8d431d6fd262fdc4d0fe298c1eb7d4757e9'
            '4005781c5e79d6aee5f76f5544cfea1b1c73e296ed612fda17c5cd0e465970039e16c1295172fd66f6dc05a6752fced5ba353ec763f7e2d04f2c6912711e9e24')
