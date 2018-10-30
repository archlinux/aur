# Maintainer: kausban <mail at kausban com>
pkgname=polar-bookshelf-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Polar Bookshelf"
arch=('x86_64')
url="https://github.com/burtonator/polar-bookshelf"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
source_x86_64=("https://github.com/burtonator/polar-bookshelf/releases/download/v"$pkgver"/polar-bookshelf-"$pkgver"-x64.tar.gz"
"polar-bookshelf.desktop")
sha512sums_x86_64=('dbf3e322f4830092975dfc9a22e8a8a2cbe9b577dcf1671e0e15fd87c6f72bddec46554425c21330cb1c4109803b299c2fe266dbe98be2b820cd9258e19701bc'
                   '245196d23eb0c724bba1ba09e8234cc8dfdd230fcd02e8083c84d65d4721886977a111e19511d5afee9b8b61458ab851e6263dad31be9bbe0f4f5a3607f00690')

package(){
	# place files
    install -d "${pkgdir}/usr/lib/polar-bookshelf"
    cp -a ${srcdir}/polar-bookshelf-"$pkgver"-x64/* "${pkgdir}/usr/lib/polar-bookshelf"

    # symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/polar-bookshelf/polar-bookshelf" "${pkgdir}/usr/bin/polar-bookshelf"

    # desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/polar-bookshelf.desktop"

    # Place license files
    for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
        install -Dm644 "${pkgdir}/usr/lib/polar-bookshelf/${license}" "${pkgdir}/usr/share/licenses/polar-bookshelf/${license}"
        rm "${pkgdir}/usr/lib/polar-bookshelf/${license}"
    done
}
