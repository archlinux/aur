# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.4.0
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

sha512sums=('6c574738dd2740f1c9ada49e952b38a83dee0f5de558c2a92f5057ca10e3bfbccafa7691c2d571ad3a535ce44952a84179ad8d06c9ab5971e1b582746e5dfc5f'
            '7423af432f366a9c1d7c5ca0c54ca7cb1afebeecf3d979df4f1fff53ce11d611332dbe578cea5a7f4362d183c1a6c8d431d6fd262fdc4d0fe298c1eb7d4757e9'
            'c4efd756f90cc35b462ab5be5fcd3bf34b7aef6286ae23669c36937660ea9d46c3d7df95957683a1a39342477c093c51a373aea5d96d062dc0617c0617317250')
