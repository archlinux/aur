# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=n-link
pkgver=0.1.6
pkgrel=1
epoch=
pkgdesc="Free, cross-platform, CX-II compatible computer linking program for the TI-Nspire."
arch=("x86_64")
url="https://lights0123.com/n-link/"
license=('GPL3')
groups=()
depends=("nodejs-lts-fermium" "webkit2gtk" "squashfs-tools")
makedepends=()
checkdepends=()
optdepends=()
provides=("n-link")
conflicts=("n-link-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/lights0123/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
        "69-${pkgname}.rules")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('85afe0a52ee8f1bd0c7d61f3cbac5d24db89963d11e942c330a968125f8051e2'
            '08274e4c02e4321f352412af6d539a33151c6136cace924b29150520ccd79e7d')
validpgpkeys=()

package() {
	ar p "${pkgname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -
        find "${pkgdir}" -type d -exec chmod 755 {} \;
        find "${pkgdir}/usr/bin/" -type f -executable -exec chmod 755 {} \;
        mkdir -p "${pkgdir}/etc/udev/rules.d/"
        install -Dm644 "69-${pkgname}.rules" "${pkgdir}/etc/udev/rules.d/69-${pkgname}.rules"
}
