# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname=aliae
_repo="JanDeDobbeleer/$_pkgname"
pkgname="$_pkgname-bin"
pkgver="0.18.0"
pkgrel=1
pkgdesc="Cross shell and platform alias management"
arch=(x86_64 armv7h aarch64)
url="https://github.com/$_repo"
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
source_x86_64=("$_pkgname::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_armv7h=("$_pkgname::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-arm")
source_aarch64=("$_pkgname::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-arm64")
noextract=()
sha256sums=(
    'SKIP'
)
sha256sums_x86_64=('0b4632d9d246ed127b8a66cb6c01fd43a312559c2da4702246810314ab8c9069')
sha256sums_armv7h=('f42161bf4f3ce681df01058a4549d1c942b1b68d9291f4a3ffed053dd1a47153')
sha256sums_aarch64=('73ec4acd2c105365fd0a49e4d2aefcf3625b6d7dbea9321b42abbb116da4b9b9')

pkgver() {
    curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
        jq -r .tag_name | # Get tag name
        sed 's/^v//' # Remove leading `v`
}

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"    
}
