pkgname=aurindexer-git
pkgver=r0.f5a3386
pkgrel=1
pkgdesc="Buscador TUI nativo y optimizado con soporte paralelo para AUR y repositorios oficiales"
arch=('x86_64')
url="https://github.com/ReyzerMC/AurIndexer"
license=("GPL3")
depends=('glibc' 'yay')
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

