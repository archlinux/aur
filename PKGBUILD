# Maintainer: Alexis Potelle <alexispotelle at gmail dot com>

_instname=malt
pkgname=malt 
pkgver=1.0.0
pkgrel=1
pkgdesc="A native desktop application for easy access to Malt, the online freelance and professional assignment platform."
arch=('x86_64')
url=https://www.malt.com/ 
license=('GNU AGPL')
groups=()
depends=()
makedepends=(nodejs nodejs-nativefier npm)
provides=($pkgname)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
source=("gen.png"
        "gen.desktop"
        "no-scrollbar.css")
sha256sums=('378a556cbdd699efe1031970cbff94c4ea5f7edca4af76b0374acfaf3430a1e5'
            '7e9db082baae45b560e7e8cf9d8ba176f80c93487e6fcc9eb7c227fef007ea81'
            '1474a74c47dfeb879d4a2538b3b24bfdca75be878fbe1c04fd82fba2e112f381')


build() {
    nativefier $url \
      --icon gen.png \
      --name $_instname \
      --user-agent "Mozilla/5.0 (X11; Linux ${CARCH};) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.133 Safari/537.36"\
      --inject no-scrollbar.css\
      --internal-urls "(.*?malt\..*?)" \
      --single-instance \
      --tray
    

}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 gen.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    cp $srcdir/gen.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}

