# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Ibrahim Tunali <ibrahimtunali at gmail dot com>

pkgname=git-secret
pkgver=0.3.2
pkgrel=2
pkgdesc='A bash-tool to store your private data inside a git repository'
arch=('any')
url='https://github.com/sobolevn/git-secret/'
license=('MIT')
depends=('git' 'gnupg')
makedepends=('ruby-ronn')
source=('LICENSE'
        "git-secret-${pkgver}::https://github.com/sobolevn/git-secret/archive/v${pkgver}.tar.gz"
)
sha256sums=('6d4b9636df66066960e535a499484a7b334f1b362547be5314349d66fe588b05'
            '07b32b096e5ff5b4818096b1858c1f69df4684bb0f256e620514cf88f44ded85'
)

build() {
    cd "$srcdir/git-secret-${pkgver}"
    make clean build build-man
}

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "git-secret-${pkgver}"
    install -Dm755 git-secret "$pkgdir/usr/bin/git-secret"
    install -Dm644 man/man1/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 man/man7/*.7 -t "$pkgdir/usr/share/man/man7/"
}
