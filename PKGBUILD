# Maintainer: Louise <louise dot aur at mailbox dot org>

pkgname=twinejs-standalone
pkgver=2.3.16
pkgrel=2
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')

depends=('libxss'
         'nss'
         'gtk3')

source=("https://github.com/klembot/twinejs/releases/download/${pkgver}/twine_${pkgver}_linux64.zip"
        "http://twinery.org/homepage/img/logo.svg"
        "twinejs.desktop")

md5sums=('88fb6a7b8bbd62d82d875bf582f9c986'
         'c7119a1fb9d65014691b77778e5e5ec7'
         '71705539c71923a8464240a8cb3e567f')

noextract=(twine_${pkgver}_linux64.zip)

prepare() {
    mkdir -p ${pkgname}_${pkgver}_linux64
    bsdtar -xf twine_${pkgver}_linux64.zip -C "${pkgname}_${pkgver}_linux64"
}

package() {
    find "${pkgname}_${pkgver}_linux64" -type f -exec install -Dm 755 "{}" "$pkgdir/opt/{}" \;
    install -D twinejs.desktop "$pkgdir/usr/share/applications/twinejs.desktop"
    install -D logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/twinejs.svg"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}_${pkgver}_linux64/twine" "$pkgdir/usr/bin/Twine"
}
