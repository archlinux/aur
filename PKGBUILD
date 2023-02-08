# Maintainer: Louise <louise dot aur at mailbox dot org>

pkgname=twinejs-standalone
pkgver=2.6.1
pkgrel=1
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')

depends=('libxss'
         'nss'
         'gtk3')

source=("https://github.com/klembot/twinejs/releases/download/${pkgver}/Twine-${pkgver}-Linux-x64.zip"
        "https://twinery.org/icons/twine.svg"
        "twinejs.desktop")

md5sums=('efe232c01ccc162ddf7a1b7d1e4f31b3'
         '3697bac4f363f894cf3ef707cc36b7b5'
         '71705539c71923a8464240a8cb3e567f')

noextract=(twine_${pkgver}_linux64.zip)

prepare() {
    mkdir -p ${pkgname}_${pkgver}_linux64
    bsdtar -xf Twine-${pkgver}-Linux-x64.zip -C "${pkgname}_${pkgver}_linux64"
}

package() {
    find "${pkgname}_${pkgver}_linux64" -type f -exec install -Dm 755 "{}" "$pkgdir/opt/{}" \;
    install -D twinejs.desktop "$pkgdir/usr/share/applications/twinejs.desktop"
    install -D twine.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/twinejs.svg"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}_${pkgver}_linux64/twine" "$pkgdir/usr/bin/Twine"
}
