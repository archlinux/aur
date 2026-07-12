pkgname=aurindexer-git
pkgver=r5.90d4ebd
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
    cd "AurIndexer/AurIndexer"

    dotnet publish -c Release -r linux-x64 --self-contained true /p:PublishAot=true
}

package() {
    cd "AurIndexer/AurIndexer"
    install -Dm755 "bin/Release/net10.0/linux-x64/publish/AurIndexer" "${pkgdir}/usr/bin/aurindexer"
}

