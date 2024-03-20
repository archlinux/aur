# Maintainer: Manuel Thalmann <m@nuth.ch>
_pkgname=godot-manager
_repo="eumario/$_pkgname"
_archive="$_pkgname.zip"
pkgname="$_pkgname-bin"
pkgver="0.2.3"
pkgrel=1
pkgdesc="A Project, Version and Addons/Plugins manager for Godot Game Engine."
arch=(x86_64)
url="https://github.com/$_repo"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'jq' 'sed')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=(!strip) # prevent godot build from breaking
install=
source=(
    "$_archive::https://github.com/$_repo/releases/download/v$pkgver/godotmanager-linux-v$pkgver.zip"
    "LICENSE::https://raw.githubusercontent.com/$_repo/v$pkgver/LICENSE"
)
noextract=("$_archive")
sha256sums=(
    'f1d1100e9537329f0e9b3bf68b4f6692b9390fe5df31662afb3add5f7c5d7bb5'
    'SKIP'
)

pkgver() {
    curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
        jq -r .tag_name | # Get tag name
        sed 's/^v//' # Remove leading `v`
}

package() {
    _installDir="$pkgdir/opt/$_pkgname"
    _binDir="$pkgdir/usr/bin"
    install -dm755 "$_binDir"
    install -dm755 "$_installDir"
    unzip "$_archive" -d "$_installDir"
    ln -s "/opt/$_pkgname/GodotManager.${arch[0]}" "$_binDir/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"    
}
