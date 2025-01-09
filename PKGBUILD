# Maintainer: kausban <mail at kausban com>
pkgname=openaudible-bin
pkgver=4.5
pkgrel=1
pkgdesc="a cross-platform audiobook manager designed for Audible users. Manage all your audiobooks with this easy-to-use desktop application"
arch=('x86_64')
url="https://openaudible.org"
license=('Apache')
depends=("java-runtime-headless" "desktop-file-utils" "webkit2gtk")
source=("https://github.com/openaudible/openaudible/releases/download/v"$pkgver"/OpenAudible_"$pkgver"_x86_64.deb"
        "openaudible.desktop")
sha512sums=('a6bcc36116cda10848b59e77418cc977a73d020daa2e8dad49a508966892872ed7c5bd11319f621b55150b1af2a48c1d7035bb2624abb6df671ce3e66042d7bc'
            '98a51684cdb701e464152bc4ce20634dd5da9c85eb69d7c91744779bf504c0e7d662aa8e7f039a81a38a41d685197366b37b1f1801bb6bd5d5f3f2dd2cddde21')

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
}
