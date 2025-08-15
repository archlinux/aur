# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname=aliae
_repo="JanDeDobbeleer/$_pkgname"
pkgname="$_pkgname-bin"
pkgver=0.26.6
pkgrel=1
_filename="$_pkgname-$pkgver-$pkgrel"
pkgdesc="Cross shell and platform alias management"
arch=(x86_64 armv7h aarch64)
url="https://aliae.dev"
license=('MIT')
groups=()
depends=('ncurses')
makedepends=('curl' 'git' 'jq' 'sed')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install="$pkgname.install"
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "LICENSE::https://raw.githubusercontent.com/$_repo/v$pkgver/LICENSE"
)
source_x86_64=("$_filename::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_armv7h=("$_filename::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-arm")
source_aarch64=("$_filename::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-arm64")
noextract=()
sha256sums=('df419cb226a6174d115f4306653312cb924e47c8e87209243ecb76a4031355cf')
sha256sums_x86_64=('808bbe54b7464d252c27e92c301022fb188784d2f26fe5d238fabb475b162443')
sha256sums_armv7h=('808bbe54b7464d252c27e92c301022fb188784d2f26fe5d238fabb475b162443')
sha256sums_aarch64=('808bbe54b7464d252c27e92c301022fb188784d2f26fe5d238fabb475b162443')

pkgver() {
    curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
        jq -r .tag_name | # Get tag name
        sed 's/^v//' # Remove leading `v`
}

package() {
    install -Dm755 "$_filename" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"    
}
