# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: AeroNotix <aaron.l.france@gmail.com>
# Contributor: AeroNotix <aaron.l.france@gmail.com>

pkgname=rebar
epoch=1
pkgver=2.6.4
pkgrel=7
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/rebar/rebar"
license=('Apache-2.0')
depends=('erlang-core')
makedepends=(
  'erlang'
  'git'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/rebar/rebar/archive/$pkgver.tar.gz"
  "https://src.fedoraproject.org/rpms/erlang-rebar/raw/rawhide/f/rebar-0015-Disable-two-test-suites-in-Erlang-24.patch"
)
sha256sums=('577246bafa2eb2b2c3f1d0c157408650446884555bf87901508ce71d5cc0bd07'
            'da6bd83431c232e79e96066792b93cd7eac4a64fb53d61024fdf5de0874e7213')

prepare() {
  cd "$srcdir/rebar-$pkgver"
  patch -Np1 -i ../rebar-0015-Disable-two-test-suites-in-Erlang-24.patch
}

build() {
  cd "$srcdir/rebar-$pkgver"
  make
}

check() {
  cd "$srcdir/rebar-$pkgver"
  ./rebar eunit
}

package() {
  cd "$srcdir/rebar-$pkgver"
  install -Dm0755 "rebar" "$pkgdir/usr/bin/rebar"
  install -Dm0644 "priv/shell-completion/bash/rebar" "$pkgdir/usr/share/bash-completion/completions/rebar"
  install -Dm0644 "priv/shell-completion/zsh/_rebar" "$pkgdir/usr/share/zsh/functions/Completion/Zsh/_rebar"
  install -Dm0644 "priv/shell-completion/fish/rebar.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rebar.fish"
}
