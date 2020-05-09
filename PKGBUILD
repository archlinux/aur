# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="OpenAudible"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
options=('!strip' '!emptydirs')
depends=("java-runtime-headless" "desktop-file-utils") 
source=("https://github.com/openaudible/openaudible/releases/download/v"$pkgver"/OpenAudible_"$pkgver"_x86_64.deb"
       "openaudible.desktop")
sha512sums=('3bbfbc27af4167eaa9b5bea44755373f74eba69a0101ff3ef57f67d0a22ebb81a801f8028c868d5bd4934f762f598bada2bca044afcef4f596a04e962fc0a3b4'
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
