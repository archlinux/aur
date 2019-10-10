# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>

pkgname=gophish
pkgver=0.8.0
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/v$pkgver/$pkgname-v$pkgver-linux-32bit.zip")
sha512sums_i686=("ccd9c8798830a917848698272397c25505cd1e3a1a36083985779f2876ff77ed89b7955fcf153af16ac5129549b555e3d82b56e1b61e6df85323f4ff73ecceba")
source_x86_64=("https://github.com/gophish/gophish/releases/download/v$pkgver/$pkgname-v$pkgver-linux-64bit.zip")
sha512sums_x86_64=("79cc4633368c421ae4daaeda0751255cc8d00fbdd6f56946134837e928ba9ff2081691b693a015979ad3137f41702f257da1ffd63712424822ea09520b9b92ec")
source=("gophish.service")
sha512sums=("c712c7680f661d399d0613ad2ff5598f2ef6a7f385567b264b55675feee052718da009e0b9dd3c5b5b56f5ba1de0165860eee53eacbdcd939289d34f42e0e147")

package() {
        install -dm755 "$pkgdir"/usr/share/"$pkgname"/{db,static,templates}

        cp -r "$srcdir"/db/* "$pkgdir"/usr/share/"$pkgname"/db/
        cp -r "$srcdir"/static/* "$pkgdir"/usr/share/"$pkgname"/static/
        cp -r "$srcdir"/templates/* "$pkgdir"/usr/share/"$pkgname"/templates/

        install -Dm755 "$srcdir"/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
        install -Dm644 "$pkgname".service "$pkgdir"/usr/lib/systemd/system/"$pkgname".service
        install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
        install -Dm644 "$srcdir"/README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
        install -Dm644 "$srcdir"/config.json "$pkgdir"/usr/share/"$pkgname"/config.json
        install -Dm644 "$srcdir"/VERSION "$pkgdir"/usr/share/"$pkgname"/VERSION
}
