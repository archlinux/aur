# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="OpenAudible"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
options=('!strip' '!emptydirs')
depends=("java-runtime-headless")
source=("https://github.com/openaudible/openaudible/releases/download/v"$pkgver"/OpenAudible_"$pkgver"_amd64.deb"
       "openaudible.desktop")
sha512sums=('a7bf6ca42289c09ece83e94facf0880e589c278845058d8aba10978acf2c57212a191a95c4f90d02727925233390c4b8f2fbbe5c20ef846efbf126dd1e96d928'
            'fe26bdc5a28f492c60e13f481bd61ae53b299b0b0728311521bb03a73f9592d8de5dda9e8e1ef5e770c74b6335e5b32c22d4b65a38325f8f5f6c1283cdc0c937')

package(){

    # Extract package data
    tar xzf data.tar.gz -C "${pkgdir}"

    I4J_INSTALL_LOCATION="/opt/OpenAudible"

    # symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -sf "$I4J_INSTALL_LOCATION/OpenAudible" "${pkgdir}/usr/bin/openaudible"

    # desktop entry and icons
    install -Dm644 "${pkgdir}/${I4J_INSTALL_LOCATION}/.install4j/OpenAudible.png" "$pkgdir/usr/share/pixmaps/openaudible.png"
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/openaudible.desktop"

    # Place license files
    install -D -m644 "${pkgdir}/opt/OpenAudible/bin/ffmpeg license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
