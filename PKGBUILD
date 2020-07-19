# Maintainer: Marek Darocha <aur@mdarocha.pl>
pkgname=fsharp-language-server
pkgver=0.1.27
pkgrel=1
epoch=0
pkgdesc="Language server for F#, utilizing the Language Server Protocol"
arch=('x86_64')
url="https://github.com/fsprojects/fsharp-language-server"
license=('MIT')
depends=('dotnet-host>=3.1.3')
makedepends=('dotnet-sdk>=3.1.3')
source=("https://github.com/fsprojects/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e19288c77c6511ad21fa3b8f66b9c71e')
options=(!strip)

build() {
    cd "${srcdir}"/"${pkgname}-${pkgver}"/
    dotnet publish src/FSharpLanguageServer/FSharpLanguageServer.fsproj -c Release --self-contained false -p:PublishSingleFile=true -p:RuntimeIdentifier=linux-x64 -o ./out/
}

package() {
    umask 022
    install -Dm755 "${srcdir}"/"${pkgname}-${pkgver}"/out/FSharpLanguageServer "${pkgdir}"/usr/bin/"${pkgname}"
}
