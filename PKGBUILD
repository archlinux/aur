# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=wutag
pkgver=0.5.0
pkgrel=2
epoch=
pkgdesc="CLI tool for tagging files"
arch=('x86_64')
url="https://github.com/vv9k/wutag"
license=('MIT')
depends=()
makedepends=()
install=".install"
provides=("wutag")
conflicts=("wutag")
source=("${url}/releases/download/${pkgver}/wutag-${pkgver}-x86_64-unknown-linux.tar.xz")
sha256sums=("c69177acd97d858023a963de676d54c61b8831523454f671e468a4e3fd81171a")

build() {
    cd "$pkgname"
    ./wutag print-completions bash > wutag.bash
    ./wutag print-completions fish > wutag.fish
    ./wutag print-completions zsh  > _wutag
}

package() {
    cd "$pkgname"
    install -Dm755 "wutag" "$pkgdir/usr/bin/wutag"
    install -Dm755 "wutagd" "$pkgdir/usr/bin/wutagd"
    install -Dm644 "wutagd.service" "$pkgdir/etc/systemd/user/wutagd.service"

    install -Dm644 "wutag.1" "$pkgdir/usr/share/man/man1/wutag.1"
    install -Dm644 "wutag.bash" "$pkgdir/usr/share/bash-completion/completions/wutag"
    install -Dm644 "wutag.fish" "$pkgdir/usr/share/fish/vendor_completions.d/wutag.fish"
    install -Dm644 "_wutag" "$pkgdir/usr/share/zsh/site-functions/_wutag"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
