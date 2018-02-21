# Maintainer: Giga300 <giga300@protonmail.com>

pkgname=bitwarden-git
_pkgname=desktop
pkgver=v0.0.7.r1.gdea275f
_pkgver=0.0.7
pkgrel=1
pkgdesc="A secure and free password manager for all of your devices."
arch=('x86_64')
url="https://bitwarden.com"
license=('GPL3')
groups=('')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'electron' 'expat' 'fontconfig' 'freetype2' 'gconf' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('nodejs' 'yarn' 'rpm-org')
conflicts=('bitwarden')
install=${pkgname}.install

source=(git+https://github.com/bitwarden/${_pkgname}.git)
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    #Install Dependencies
    yarn

    # Build
    yarn dist:lin

    #Copy DOTDEB in SRC Directory
    cp ./dist/bitwarden_${_pkgver}_amd64.deb $srcdir/bitwarden.deb
}

package(){

    # Extract DOTDEB Package
    ar xv bitwarden.deb

    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
