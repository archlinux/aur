# Maintainer: Ayush Agarwal <ayush at fastmail dot in>
# Contributor: Ben Oliver <ben at bfoliver dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>
# Contributor: Julian Paul Dasmarinas <julian.dasma at gmail dot com>

pkgname=buku
pkgver=4.6
pkgrel=1
pkgdesc="Bookmark manager like a text-based mini-web"
arch=(x86_64)
url="https://github.com/jarun/buku"
license=('GPL')
depends=('python'
         'python-certifi'
         'python-urllib3'
         'python-cryptography'
         'python-beautifulsoup4'
         'python-html5lib')
makedepends=('python-setuptools')
optdepends=('wl-clipboard: to copy text in wayland'
            'wl-clipboard-rs: to copy text in wayland'
            'xsel: to copy text in xorg'
            'xclip: to copy text in xorg')
conflicts=('buku-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jarun/buku/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e1968016d3856184db8ac49cdc92a6c70869f62846185f28c8c60ead0c42888')

package() {
    cd "$pkgname-$pkgver"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

    rm -f "$pkgdir"/usr/bin/bukuserver
    rm -rf "$pkgdir"/usr/lib/python3.9/site-packages/bukuserver
    gzip -f buku.1

    install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
    install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/usr/share/bash-completion/completions/buku"
    install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
    install -Dm644 buku.1.gz "${pkgdir}/usr/share/man/man1/buku.1.gz"
}
