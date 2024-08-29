# Maintainer: Irfan Hakim <irfanhakim.as@yahoo.com>
pkgname='kf6-servicemenus-reimage'
pkgver=2.6.0
pkgrel=1
pkgdesc="Manipulate images e their metadata"
arch=('any')
url="https://github.com/irfanhakim-as/kde-service-menu-reimage"
license=('GPL-3.0+')
depends=('dolphin' 'imagemagick' 'kdialog')
optdepends=('jhead: required for extracting exif data')
provides=()
conflicts=('kde-service-menu-reimage' 'kde-service-menu-reimage-mod')
replaces=()
source=("${url}/releases/download/v${pkgver}/kde-service-menu-reimage_${pkgver}_${arch[0]}.tar.gz")
md5sums=('acc6ec84363579911b366e62ff79bb22')

package() {
    # determine installation paths
    bin_dir="$(qtpaths --install-prefix)/bin"
    servicemenu_dir="$(qtpaths --locate-dirs GenericDataLocation kio/servicemenus | sed 's/.*://')"
    doc_dir="$(qtpaths --install-prefix)/share/doc/kde-service-menu-reimage/"
    # install required binaries
    install -d "${pkgdir}${bin_dir}" && \
    install -m 755 -p "${srcdir}"/bin/* "${pkgdir}${bin_dir}" && \
    # install required service menus
    install -d "${pkgdir}${servicemenu_dir}" && \
    install -m 755 -p "${srcdir}"/ServiceMenus/*.desktop "${pkgdir}${servicemenu_dir}" && \
    # install documentation files
    install -d "${pkgdir}${doc_dir}" && \
    install -m 644 -p "${srcdir}"/doc/* "${pkgdir}${doc_dir}"
}
