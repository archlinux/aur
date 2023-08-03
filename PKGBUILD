# Maintainer: Aneesh <anemovva@gmail.com>

pkgname=lunar-client-qt2
pkgver=2.3.0
pkgrel=2
source=("https://cdn.discordapp.com/icons/1134376256750755890/0d129e0190943de0d230cac3a5c79a2c.png?size=4096", "https://gist.githubusercontent.com/anemovva/141e7b3c76ba3065ea1beacf6d8680f5/raw/b18cf377fa108a6899685afbec4bc4dfb4f183bc/lcqt2.desktop")
depends=(lunar-client)
license=(unknown)
pkgdesc="Lunar Client QT2 is a program that adds features to the popular PvP client Lunar Client."
arch=('x86_64')
url=https://github.com/Nilsen84/lcqt2
sha256sums=('ec5d32867c9ece0bfa9c7813f2cc0f07feec6f108e5ad5a475151850f0b77ba8'
            'e5e5610cc8f07722b00fbc78da8157671d86d9ca932102260f1ae252c0524505')

prepare(){

    # I know this shouldn't go here, but it breaks when I put it in the sources section for some reason.
    wget "https://github.com/Nilsen84/lcqt2/releases/download/v${pkgver}/linux-portable.tar.gz"
    tar -xzf "linux-portable.tar.gz"
    rm linux-portable.tar.gz
    mv "0d129e0190943de0d230cac3a5c79a2c.png?size=4096," lcqt2.png
    chmod +x "Lunar Client Qt"
}

package(){

    install -D "${srcdir}/gui.asar" "${pkgdir}/opt/lcqt2/gui.asar"
    install -D "${srcdir}/agent.jar" "${pkgdir}/opt/lcqt2/agent.jar"
    install -D "${srcdir}/Lunar Client Qt" "${pkgdir}/opt/lcqt2/Lunar Client Qt"
    install -D "${srcdir}/lcqt2.png" "${pkgdir}/opt/lcqt2/lcqt2.png"

    install -Dm644 "${srcdir}/lcqt2.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -d "${pkgdir}/usr/bin/"

    # rm "${pkgdir}/usr/bin/lunarclientqt2"
    ln -sf "${pkgdir}/opt/lcqt2/Lunar Client Qt" "${pkgdir}/usr/bin/lunarclientqt2"
}

