# Maintainer: Thom Wiggers <aur@thomwiggers.nl>
# Contributor: Radeox <dawid.weglarz95@gmail.com>
pkgname="pomodoneapp"
pkgver="1.5.1545"
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
sha256sums_i686=('d5d24a36bc213348e3c51f2e6809a7dd5a64b08b3a5523c5491935a9c7ff0662')
sha256sums_x86_64=('a77a3e199181e7d8d121274d12a5b833d771b094bd259ee956bee20a524ef700')

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
