# Maintainer: Zhang Hua <zhanghuadedn at gmail dot com>
# Contributor: Coelacanthus <coelacanthus@outlook.com.com>
# Contributor: yjun <jerrysteve1101@gmail.com>

pkgname='hentaiathome'
pkgver=1.6.1
pkgrel=3
pkgdesc="An open-source Peer-2-Peer gallery distribution system which reduces the load on the E-Hentai Galleries"
arch=('x86_64')
url="https://ehwiki.org/wiki/Hentai@Home"
license=('GPL3')
provides=('hentaiathome-bin' 'hentaiathome-cli' 'hentaiathome-gui')
conflicts=('hentaiathome-bin' 'hentaiathome-cli' 'hentaiathome-gui')
depends=('java-runtime>=8' 'sqlite-jdbc')
source=("HentaiAtHome_${pkgver}.zip::https://repo.e-hentai.org/hath/HentaiAtHome_${pkgver}_src.zip"
        "hentaiathome@.service"
        "hentaiathome.desktop"
        "hentaiathome-cli"
        "hentaiathome-gui")
sha256sums=('9d843b4af8c109450938206f7d72e7a90bd0fca6b3922ac555aaf328ee7c0e5b'
            '5bde26294110d8454c40772ed147238741ab7d992e7c5f8054e2cd139222258f'
            'c50d1fb930990b033445351d7186634ed55bd083dbbb634680507300211145a6'
            '6f9896d1311cc10a4fe5104e77362422eedd58198ba85b1f9093f7a290189f1e'
            '809101ea8371bb3a5f8ebd17cd6cd4bf325f32273b44ea186424c6e6e7f4e66e')

build(){
    cd "${srcdir}"
    ln -s /usr/share/java/sqlite-jdbc/sqlite-jdbc.jar sqlite-jdbc.jar
    make hath
    make jar
}
package(){
    cd "${srcdir}"
    install -Dm644 build/HentaiAtHome.jar "${pkgdir}/usr/lib/hath/HentaiAtHome.jar"
    install -Dm644 build/HentaiAtHomeGUI.jar "${pkgdir}/usr/lib/hath/HentaiAtHomeGUI.jar"
    install -Dm644 src/hath/gui/icon16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/hentaiathome.png"
    install -Dm644 src/hath/gui/icon32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hentaiathome.png"
    install -Dm644 hentaiathome.desktop "${pkgdir}/usr/share/applications/hentaiathome.desktop"
    install -Dm644 hentaiathome@.service "${pkgdir}/usr/lib/systemd/system/hentaiathome@.service"
    install -Dm755 hentaiathome-cli "${pkgdir}/usr/bin/hentaiathome-cli"
    install -Dm755 hentaiathome-gui "${pkgdir}/usr/bin/hentaiathome-gui"
    ln -sf /usr/share/java/sqlite-jdbc/sqlite-jdbc.jar "${pkgdir}/usr/lib/hath/sqlite-jdbc.jar"
}

