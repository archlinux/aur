# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname=aliae
_repo="JanDeDobbeleer/$_pkgname"
pkgname="$_pkgname-bin"
pkgver="0.22.1"
pkgrel=1
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
source_x86_64=("$_pkgname::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_armv7h=("$_pkgname::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-arm")
source_aarch64=("$_pkgname::https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-linux-arm64")
noextract=()
sha256sums=(
    'SKIP'
)
sha256sums_x86_64=('76edff235bb2578299ec70f683e1804d88f137bb16fa881e2c8e7656d47f7fa8')
sha256sums_armv7h=('76edff235bb2578299ec70f683e1804d88f137bb16fa881e2c8e7656d47f7fa8')
sha256sums_aarch64=('76edff235bb2578299ec70f683e1804d88f137bb16fa881e2c8e7656d47f7fa8')

pkgver() {
    curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
        jq -r .tag_name | # Get tag name
        sed 's/^v//' # Remove leading `v`
}

package() {
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"    
}
