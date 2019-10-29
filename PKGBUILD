# Maintainer: kausban <mail at kausban com>
pkgname=polar-bookshelf-bin
pkgver=1.40.1
pkgrel=1
pkgdesc="Polar Bookshelf"
arch=('x86_64')
url="https://github.com/burtonator/polar-bookshelf"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
source_x86_64=("https://github.com/burtonator/polar-bookshelf/releases/download/v"$pkgver"/polar-bookshelf-"$pkgver"-x64.tar.gz"
"polar-bookshelf.desktop"
"polar-bookshelf.svg")
sha512sums_x86_64=('523979bfd24bd885d8f706ba1ef5af7e781a3d7a28e575a6e5ec9590694519aa4bbc9908f3c864368e5ea8c58fda476abb9cb601d4a293478571e4211f65c389'
                   '245196d23eb0c724bba1ba09e8234cc8dfdd230fcd02e8083c84d65d4721886977a111e19511d5afee9b8b61458ab851e6263dad31be9bbe0f4f5a3607f00690'
                   '2f1c91308fa6fc30496501894f5c9454799e26437000843f00cf0ab4b94713a1500a734c0f5590f86dae8bab7e34107670571ea2fde18981669a17ede61d1829')

package(){
	# place files
    install -d "${pkgdir}/usr/lib/polar-bookshelf"
    cp -a ${srcdir}/polar-bookshelf-"$pkgver"-x64/* "${pkgdir}/usr/lib/polar-bookshelf"

    # symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/polar-bookshelf/polar-bookshelf" "${pkgdir}/usr/bin/polar-bookshelf"

    # desktop entry and icons
    install -Dm644 "${srcdir}/polar-bookshelf.svg" "$pkgdir/usr/share/pixmaps/polar-bookshelf.svg"
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/polar-bookshelf.desktop"

    # Place license files
    for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
        install -Dm644 "${pkgdir}/usr/lib/polar-bookshelf/${license}" "${pkgdir}/usr/share/licenses/polar-bookshelf/${license}"
        rm "${pkgdir}/usr/lib/polar-bookshelf/${license}"
    done
}
