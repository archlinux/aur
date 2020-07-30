# Maintainer: dranion <dranion@pm.me>
# Contributer: kausban <mail at kausban com> 
pkgname=polar-bookshelf-bin-beta
pkgver=2.0.0
pkgrel=11
pkgdesc="Polar Bookshelf Beta"
arch=('x86_64')
url="https://github.com/burtonator/polar-bookshelf"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
conflicts=('polar-bookshelf-bin')
source_x86_64=("https://github.com/burtonator/polar-bookshelf/releases/download/v"$pkgver"-beta."$pkgrel"/polar-desktop-app-"$pkgver"-beta."$pkgrel"-x64.tar.gz"
"polar-bookshelf.desktop"
"polar-bookshelf.svg")

md5sums_x86_64=('54eb43af782bb3add42dfb21a17035c8'
                'b2228efc30c42e5367e7c5eeee1b924c'
                '35ca519dbf171f3fce2349215615c8d6')
package(){
	# place files
    install -d "${pkgdir}/usr/lib/polar-desktop-app"
    cp -a ${srcdir}/polar-desktop-app-"$pkgver"-beta."$pkgrel"-x64/* "${pkgdir}/usr/lib/polar-desktop-app"


    # symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/polar-desktop-app/polar-desktop-app" "${pkgdir}/usr/bin/polar-desktop-app"

    # desktop entry and icons
    install -Dm644 "${srcdir}/polar-bookshelf.svg" "$pkgdir/usr/share/pixmaps/polar-bookshelf.svg"
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/polar-bookshelf.desktop"

    # Place license files
    for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
        install -Dm644 "${pkgdir}/usr/lib/polar-desktop-app/${license}" "${pkgdir}/usr/share/licenses/polar-desktop-app/${license}"
        rm "${pkgdir}/usr/lib/polar-desktop-app/${license}"
    done
}

