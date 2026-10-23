# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=MeanEYE
_pkgname=sunflower
pkgname=${_pkgname}-bin
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"

pkgver=0.6.64
pkgrel=1

_pkgversion="${pkgver%.*}-${pkgver##*.}"

arch=('any')
url="https://sunflower-fm.org/"
license=('GPL3')

conflicts=("${pkgname%-bin}")
provides=("${_pkgname}")

makedepends=('tar')
depends=('gtk3' 'vte3' 'python>=3.14' 'python-gobject' 'python-chardet' 'python-cairo' 'librsvg')
optdepends=('libnotify'
            'python-mutagen: audio-metadata support'
            'gvfs: mount-management')

            source=("https://github.com/MeanEYE/Sunflower/releases/download/${_pkgversion}/${_pkgname}-${pkgver}-${pkgrel}.all.deb")
sha256sums=('72bf0eea021db3ceb8f0f48c12acf3d6a6244edcf8447a47b157c3213750278f')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    mkdir -p "${pkgdir}/usr/lib/python3.14/"
    mv "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}/usr/lib/python3.14/site-packages"
    rm -rf "${pkgdir}/usr/lib/python3/"
} 
