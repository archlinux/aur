# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=2.1
pkgrel=1
pkgdesc="OpenAudible"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
options=('!strip' '!emptydirs')
depends=("java-runtime-headless" "desktop-file-utils") 
source=("https://github.com/openaudible/openaudible/releases/download/v"$pkgver"/OpenAudible_"$pkgver"_x86_64.deb"
       "openaudible.desktop")
sha512sums=('c87c374b6f4728f3c43eb50be102295176d4f18c71a6270d2a0d0eda9006dd98a759eccb9595267c554026e92fd387a31bfc138abcbb3fdeeb6389048db8bae6'
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
