# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
depends=('glibc')
optdepends=('bash-completion')
provides=('timetrace')
conflicts=('timetrace')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz"
        "README-$pkgver.md::https://raw.githubusercontent.com/dominikbraun/timetrace/v$pkgver/README.md")
sha256sums=('e5a7f0e7c91b811c868e8091475dcfe9a287776425a9da7e4d0af701da1699af'
            'a65bbb025d4ba57d8d186fd366a2ca93e3ebc1d410906063718e9080e1bb165e')

build() {
	./timetrace completion bash > timetrace.bash
	./timetrace completion zsh > _timetrace
	./timetrace completion fish > timetrace.fish
}

package() {
	install -Dm 755 timetrace -t "$pkgdir/usr/bin/"
	install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 timetrace.bash "$pkgdir/usr/share/bash-completion/completions/timetrace"
	install -Dm 644 _timetrace -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm 644 timetrace.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
