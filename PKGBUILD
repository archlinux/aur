# Maintainer: Louise <louise dot aur at mailbox dot org>

pkgname=twinejs-standalone
pkgver=2.8.0
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

b2sums=('bd6054f449229cc4bbeeda13d0277f15aebd231f16baa68802042fcb75ba707b85025807c97e729e62c570c768538ed17282de0aa818f3da1763ef842f869100'
        '8fd73e20b6809a2bd792b20f4263cbc6501bb3d4bb58236eb3bd9a9e503891bed99e4ab1f0db4510a689bba34016a2d6abb368c919ef89d039eed6641d8cdd52'
        'd45475680d4cace6d6cfa35836b77c9c264ccff255d6132312c9ec153e1bf9c9a6386edbc4974cb205e35280576de38439ccfd05f0c16c02047d3a0052d7c7d2')

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
