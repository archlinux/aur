# Maintainer: Radeox <dawid.weglarz95@gmail.com>
pkgname="pomodoneapp"
pkgver="1.5.1320"
pkgrel=1
pkgdesc="Pomodoro timer for your favourite productivity tool"
arch=('i686' 'x86_64')
url="https://pomodoneapp.com/"
depends=('gtk2' 'gconf' 'alsa-lib' 'fontconfig' 'libxtst' 'nss')
license=('custom')
source_i686=("https://app.pomodoneapp.com/installers/PomoDoneApp_${pkgver}_i386.deb")
source_x86_64=("https://app.pomodoneapp.com/installers/PomoDoneApp_${pkgver}_amd64.deb")
source=("pomodoneapp.sh")
sha256sums=('be9261737bbc09f811b17bc37bcaa4b1d753c281b46f53eb04923f327be87cea')
sha256sums_i686=('cda66dfa189ec96feeeca1d697af87a09a939175a1d67758ce88d8a4711af435')
sha256sums_x86_64=('25e6c924d9671d3485a1cf7cbd60cb7dea86702500ceaa9a3f11a55e6af0b691')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz

    sed -i -e 's/^Exec=.*$/Exec="\/usr\/bin\/pomodoneapp"/' "usr/share/applications/pomodoneapp.desktop"

    install -d -m 755 "${pkgdir}/usr/share"
    cp -dpr --no-preserve=ownership "usr/share/"* "${pkgdir}/usr/share"

    install -d -m 755 "${pkgdir}/usr/lib/pomodoneapp"
    cp -dpr --no-preserve=ownership "opt/PomoDoneApp/"* "${pkgdir}/usr/lib/pomodoneapp"

    install -D -m755 "${srcdir}/pomodoneapp.sh" "${pkgdir}/usr/bin/pomodoneapp"

    install -d -m 755 "${pkgdir}/usr/share/licenses/pomodoneapp"
    mv "${pkgdir}/usr/lib/pomodoneapp/LICENSE"* "${pkgdir}/usr/share/licenses/pomodoneapp"
}
