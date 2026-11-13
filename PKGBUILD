# Maintainer: fnrir <fnr1r0@protonmail.com>
pkgname=g3mtool
pkgver=1.3.2
_tag="2026.11.04"
pkgrel=1
epoch=
pkgdesc="Command-line tool for modding GameMaker games"
arch=(x86_64)
url="https://github.com/y114git/G3MTool"
license=('GPL-3.0-only')
groups=()
depends=(
    glibc libgcc
    libstdc++
    dotnet-runtime
)
makedepends=(dotnet-sdk)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug !strip)
install=
changelog=
source=("G3MTool-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
noextract=()
sha256sums=('7634cf3bd6e64ed45b901272e608116f74910e586601497a1f4f2ac5aa1657d2')
validpgpkeys=()

_dotnet_arch=x64
_dotnet_configuration=Release
_dotnet_framework=net10.0
_dotnet_nproject=G3MTool
_dotnet_project="${_dotnet_nproject}CLI"
_dotnet_runtime="linux-$_dotnet_arch"

_work_dir="$_dotnet_nproject-$_tag"

prepare() {
    cd "$_work_dir"
    dotnet restore "$_dotnet_project" \
        --runtime "$_dotnet_runtime"
}

build() {
    cd "$_work_dir"
    dotnet build --no-restore "$_dotnet_project" \
        --configuration "$_dotnet_configuration" \
        --framework "$_dotnet_framework" \
        --runtime "$_dotnet_runtime" \
        -p:PublishSingleFile=false --no-self-contained
}

package() {
    cd "$_work_dir"
    dotnet publish --no-build "$_dotnet_project" \
        --configuration "$_dotnet_configuration" \
        --framework "$_dotnet_framework" \
        --runtime "$_dotnet_runtime" \
        -p:PublishSingleFile=false --no-self-contained \
        -o "$pkgdir/usr/lib/g3mtool"
    install -d "$pkgdir/usr/bin"
    ln -sf "../lib/g3mtool/$_dotnet_nproject" \
        "$pkgdir/usr/bin/$_dotnet_nproject"
}

# vim: shiftwidth=4
