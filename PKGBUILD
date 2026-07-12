# Original Maintaner: Manuel Schneider <manuelschneid3r at googles mail>
# Previous Maintaner: Mochammad Naufal Septifiandi <septifiandinaufal at gmail dot com>

# Maintainer: Vijay Pedagadi <vijayv996@outlook.com>

pkgname=albert-bin
_pkgname=albert
pkgver=34.0.10
pkgrel=1
pkgdesc="A sophisticated standalone keyboard launcher. Binary version."
arch=('x86_64')
url="https://albertlauncher.github.io/"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=(
    'qt6-base' 
    'qt6-declarative' 
    'qt6-svg' 
    'qt6-scxml' 
    'qt6-5compat' 
    'libx11' 
    'hicolor-icon-theme'
    'qtkeychain-qt6'
    'libqalculate'
    'python'
    'python-pip'
    'python-cffi'
    'python-cryptography'
    'python-filelock'
    'python-attrs'
    'python-pycparser'
)
optdepends=('qt6-wayland: Wayland support')
source=("https://download.opensuse.org/repositories/home:/manuelschneid3r/Arch/x86_64/${_pkgname}-${pkgver}-0-x86_64.pkg.tar.zst")
sha256sums=('0d9bb717571a99976cec74b97eaae91823dea9f3f6d33e34c09dfcd9b822a955')
options=('!strip' '!debug')

package() {
    cd "$srcdir"

    # The source is an Arch package, which extracts to the root structure (usr, etc)
    # We copy the usr directory to the package directory
    cp -a usr "$pkgdir/"
    
    # If the package contains /etc (rare for albert binaries but possible), copy it too
    if [ -d "etc" ]; then
        cp -a etc "$pkgdir/"
    fi

    # Remove any potential metadata files from the source package (like .PKGINFO) if they got copied
    # (cp -a usr usually avoids this, but good to be safe if copying root)
}
