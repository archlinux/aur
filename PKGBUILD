# Maintainer: Wojciech Kepka <wojtek.kepka@protonmail.com>
pkgname=wutag
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="CLI tool for tagging files"
arch=('x86_64')
url="https://github.com/wojciechkepka/wutag"
license=('MIT')
depends=()
makedepends=()
provides=("wutag")
conflicts=("wutag")
sha1sums=('SKIP')
source=("${url}/releases/download/${pkgver}/wutag-${pkgver}-x86_64-unknown-linux.tar.xz")

build() {
    cd "$pkgname"
    ./wutag print-completions bash > wutag.bash
    ./wutag print-completions fish > wutag.fish
    ./wutag print-completions zsh > _wutag
}

package() {
    ls -l
	cd "$pkgname"
	install -Dm755 "wutag" "$pkgdir/usr/bin/wutag"

	install -Dm644 "wutag.1" "$pkgdir/usr/share/man/man1/wutag.1"
	install -Dm644 "wutag.bash" "$pkgdir/usr/share/bash-completion/completions/wutag"
	install -Dm644 "wutag.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wutag.fish"
	install -Dm644 "_wutag" "$pkgdir/usr/share/zsh/site-functions/_wutag"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
