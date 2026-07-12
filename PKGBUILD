pkgname=aurindexer-git
pkgver=r6.f63d502
pkgrel=1
pkgdesc="Searcher TUI with paralel support for AUR and officials repos"
arch=('x86_64')
url="https://github.com/ReyzerMC/AurIndexer"
license=("GPL3")
depends=('glibc')
optdepends=('yay' 'paru')
makedepends=('dotnet-sdk-10.0' 'git')
provides=('aurindexer')
conflicts=('aurindexer')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "AurIndexer"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/AurIndexer"

    dotnet publish -c Release -r linux-x64 --self-contained true /p:PublishAot=true /p:PublishDir="$srcdir/publish/"
}

package() {
    install -Dm755 "$srcdir/publish/AurIndexer" "${pkgdir}/usr/bin/aurindexer"
}

