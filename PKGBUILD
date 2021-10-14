# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Greg Sutcliffe <greg.sutcliffe@gmail.com>>

_reponame=ruby-shadow
pkgname=ruby27-shadow
pkgver=2.5.0
pkgrel=1
pkgdesc='Shadow password module'
arch=('x86_64')
url="https://github.com/apalmblad/${pkgname}"
license=('CPL')
depends=('ruby2.7')
source=($pkgname-$pkgver.tar.gz::https://github.com/apalmblad/$_reponame/archive/$pkgver.tar.gz)
sha512sums=('66cf0405230c0cbc723f17bf016d84b5054be4db5b32bca55ede876b5725c0f8de849c537c6020f38053825f55177bebacd0fdbb20d49110ea8cb2d5b75df9da')

build() {
  cd "${_reponame}-${pkgver}"

  ruby-2.7 extconf.rb
  make
}

package() {
  cd "${_reponame}-${pkgver}"

  make DESTDIR="$pkgdir"/ sitedir='$(rubylibprefix)/vendor_ruby' \
    sitehdrdir='$(rubyhdrdir)/vendor_ruby' install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
