# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="OpenAudible"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
options=('!strip' '!emptydirs')
depends=("java-runtime-headless" "desktop-file-utils" "webkit2gtk")  
source=("https://github.com/openaudible/openaudible/releases/download/v"$pkgver"/OpenAudible_"$pkgver"_x86_64.deb"
       "openaudible.desktop")
sha512sums=('5da8cf275615e809e023626b8e9f671ba54914daca353986beff3cab7e7356ad307d79fbd64d43169df126cdbcb03da8c33c5c88ffec15fca7202d024e6203be'
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
