# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Ibrahim Tunali <ibrahimtunali at gmail dot com>

pkgname=git-secret
pkgver=0.3.3
pkgrel=1
pkgdesc='A bash-tool to store your private data inside a git repository'
arch=('any')
url='https://github.com/sobolevn/git-secret/'
license=('MIT')
depends=('git' 'gnupg')
makedepends=('ruby-ronn')
source=("LICENSE::https://raw.githubusercontent.com/sobolevn/git-secret/v${pkgver}/LICENSE.md"
        "${pkgname}-${pkgver}::https://github.com/sobolevn/git-secret/archive/v${pkgver}.tar.gz"
)
sha256sums=('bc950a06cb1ba74afe4815dadb2f9e4639542de2894c6838924676981672d483'
            'd8c19a5cbd174e95484a4233605985dd3b060a8a83d14d41c3bad1d534c6ab39'
)

build() {
    cd "$srcdir/git-secret-${pkgver}"
    make clean build build-man
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "${pkgname}-${pkgver}"
    install -Dm755 git-secret "$pkgdir/usr/bin/git-secret"
    install -Dm644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 man/man7/*.7 -t "$pkgdir/usr/share/man/man7/"
}
