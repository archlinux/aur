# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Ibrahim Tunali <ibrahimtunali at gmail dot com>

pkgname=git-secret
pkgver=0.5.0
pkgrel=1
pkgdesc='A bash-tool to store your private data inside a git repository'
arch=('any')
url='https://github.com/sobolevn/git-secret/'
license=('MIT')
depends=('git' 'gnupg')
source=("LICENSE::https://raw.githubusercontent.com/sobolevn/git-secret/v${pkgver}/LICENSE.md"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/sobolevn/git-secret/archive/v${pkgver}.tar.gz")
sha256sums=('bc950a06cb1ba74afe4815dadb2f9e4639542de2894c6838924676981672d483'
            '1cba04a59c8109389079b479c1bf5719b595e799680e10d35ce9aa091cb752af')

build() {
    cd "$srcdir/git-secret-${pkgver}"
    make clean
    make build
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "${pkgname}-${pkgver}"
    install -Dm755 git-secret "$pkgdir/usr/bin/git-secret"
    install -Dm644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 man/man7/*.7 -t "$pkgdir/usr/share/man/man7/"
}
