# Maintainer: MD Gaziur Rahman Noor <mdgaziurrahmannoor@gmail.com>
pkgname=findex-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Highly customizable application finder with high performance. Written in Rust and uses GTK"
url="https://github.com/mdgaziur/findex"
license=("GPL3")
arch=("x86_64")
provides=("findex")
conflicts=("findex" "findex-git")
source=("https://github.com/mdgaziur/findex/releases/download/v$pkgver/findex-$pkgver-x86_64.tar.gz")
sha256sums=('06db2e1da43edc9c88f9214a75dada10cab0d1fca779a8361ce832c06b4931ed')
install=post_install.install
depends=("gtk3" "libkeybinder3")

package() {
    cd "$srcdir/findex-$pkgver-x86_64"
    install -Dm755 findex -t "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/opt/findex"
    cp style.css "$pkgdir/opt/findex"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/findex/LICENSE"

    if [[ $(pidof systemd) ]]
    then
    	install -Dm644 findex.service "${pkgdir}/etc/systemd/user/findex.service"
    	install -Dm644 findex-restarter.service "${pkgdir}/etc/systemd/user/findex-restarter.service"
    	install -Dm644 findex-restarter.path "${pkgdir}/etc/systemd/user/findex-restarter.path"
    fi
}
