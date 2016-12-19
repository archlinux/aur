# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=mitamae
pkgver=1.3.0
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

sha512sums=('cde2250c2391460d42b15dba0f2dd519ffba4a23951d55ba9e49c99eb37d7028856a1532415b0f65b0af2662a49a6714a3151ec8369e54092b29771e6f66c3f6'
            '978fb07ab503eaf70a49b23ed8ae8df4f84202a31be8492eb985032d894849479e40d88ba845956a3788327622355ef5e42976c3910ace7788c56bafc45f460c'
            '7071a0430307e0a08336a2fe307f4b2ff8f9ad9aa02759c0f01d273e699d5a5394d667740e3683422a2e972b2afb96e76c40ef40a216cda20566a9f7d6345273')
