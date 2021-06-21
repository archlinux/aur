# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>
# Contributor: Jon Yamokoski <code@jonyamo.us>

pkgname=pass-git
pkgver=1.7.4.r1.g3dd1469
pkgrel=1
epoch=1
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
arch=('any')
url='https://www.passwordstore.org/'
license=('GPL2')
depends=('bash' 'gnupg' 'tree')
optdepends=('git: for Git support'
            'dmenu: for passmenu'
            'dmenu-wayland: for passmenu in Wayland environments'
            'qrencode: for QR code support'
            'wl-clipboard: For wlroots-based Wayland clipboard support'
            'xclip: For X11 clipboard support'
            'xdotool: to type passwords with passmenu'
            'ydotool: to type passwords with passmenu in Wayland')
makedepends=('git')
provides=('pass')
conflicts=('pass')
source=("git+https://git.zx2c4.com/password-store.git")
sha256sums=('SKIP')

pkgver() {
    cd password-store
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd password-store
    make test
}

package() {
    cd password-store
    make DESTDIR="${pkgdir}" WITH_ALLCOMP=yes install

    cd contrib/dmenu
    install -Dm0755 passmenu "${pkgdir}/usr/bin/passmenu"
}
