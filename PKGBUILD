# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="pomodoneapp"
pkgver="1.5.856"
pkgrel=1
pkgdesc="Pomodoro timer for your favourite productivity tool"
arch=('i686' 'x86_64')
url="https://pomodoneapp.com/"
depends=('gtk2' 'gconf' 'alsa-lib' 'fontconfig' 'libxtst' 'nss')
license=('custom')
source_i686=("https://app.pomodoneapp.com/PomoDoneApp-${pkgver}-ia32.deb")
source_x86_64=("https://app.pomodoneapp.com/PomoDoneApp-${pkgver}.deb")
source=("pomodoneapp.sh")
sha256sums=('f35ab3bcd2c99d89edb1636d6359af1cf2b3e7af0e890ae525a23b55535b3860')
sha256sums_i686=('a47f7e85d40c392973489e97f501486756c72189d2a04fdb242671f9679d6eae')
sha256sums_x86_64=('a76c009953dd94f853688a2f6e3a952176a4f98d14dacaf2d2d5fbc06531a561')

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
