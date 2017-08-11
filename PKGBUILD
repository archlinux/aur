# Maintainer: Radeox <dawid.weglarz95@gmail.com>
pkgname="pomodoneapp"
pkgver="1.5.1084"
pkgrel=1
pkgdesc="Pomodoro timer for your favourite productivity tool"
arch=('i686' 'x86_64')
url="https://pomodoneapp.com/"
depends=('gtk2' 'gconf' 'alsa-lib' 'fontconfig' 'libxtst' 'nss')
license=('custom')
source_i686=("https://app.pomodoneapp.com/installers/PomoDoneApp-${pkgver}-ia32.deb")
source_x86_64=("https://app.pomodoneapp.com/installers/PomoDoneApp-${pkgver}.deb")
source=("pomodoneapp.sh")
sha256sums=('f35ab3bcd2c99d89edb1636d6359af1cf2b3e7af0e890ae525a23b55535b3860')
sha256sums_i686=('e0afa6772b11baeef051429736a63517c8a82e3df4eeb4890a89282262f9203c')
sha256sums_x86_64=('ce57986028c1fe1bc7e64236c36ab2b6ca6f47075ab7cac0f347affc99061f7d')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz

    sed -i -e 's/^Exec=.*$/Exec="\/usr\/bin\/pomodoneapp"/' "usr/share/applications/PomoDoneApp.desktop"

    install -d -m 755 "${pkgdir}/usr/share"
    cp -dpr --no-preserve=ownership "usr/share/"* "${pkgdir}/usr/share"

    install -d -m 755 "${pkgdir}/usr/lib/pomodoneapp"
    cp -dpr --no-preserve=ownership "opt/PomoDoneApp/"* "${pkgdir}/usr/lib/pomodoneapp"

    install -D -m755 "${srcdir}/pomodoneapp.sh" "${pkgdir}/usr/bin/pomodoneapp"

    install -d -m 755 "${pkgdir}/usr/share/licenses/pomodoneapp"
    mv "${pkgdir}/usr/lib/pomodoneapp/LICENSE"* "${pkgdir}/usr/share/licenses/pomodoneapp"
}
