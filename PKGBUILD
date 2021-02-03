# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=filetovox
pkgver=1.11
pkgrel=1
pkgdesc="Tool for convert files into Magicavoxel file"
url="https://github.com/Zarbuz/FileToVox"
license=('MIT')
arch=('x86_64')
depends=('dotnet-runtime' 'libgdiplus')
makedepends=('dotnet-sdk')
source=("https://github.com/Zarbuz/FileToVox/archive/$pkgver.tar.gz")
md5sums=('a45cd5f7fde19bd5e40363f820a43074')

build() {
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
    export DOTNET_CLI_TELEMETRY_OPTOUT=true

    cd "$srcdir/FileToVox-$pkgver"
    dotnet publish -c Release -o bin
}

package() {
    mkdir -p "$pkgdir/opt/filetovox"
    cp -ar "$srcdir/FileToVox-$pkgver/bin/." "$pkgdir/opt/filetovox"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/filetovox/FileToVox" "$pkgdir/usr/bin/FileToVox"
}
