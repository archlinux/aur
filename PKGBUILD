# Original Maintaner: Manuel Schneider <manuelschneid3r at googles mail>
# Previous Maintaner: Mochammad Naufal Septifiandi <septifiandinaufal at gmail dot com>

# Maintainer: Vijay Pedagadi <vijayv996@outlook.com>

pkgname=albert-bin
_pkgname=albert
pkgver=35.1.0
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
source=("https://github.com/vijayv996/albert-bin/releases/download/v35.1.0/albert-35.1.0-1-x86_64.pkg.tar.zst")
sha256sums=('3b6383e61733eed71c605884660121ed80b728ecace656a6b0d5b6cce427c421')
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
