# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Pio <xpio at tut dot by>
# Contributor: Marcos Heredia <chelqo@gmail.com>
#
pkgname="parrillada"
pkgver="1.18.2"
pkgrel="1"
pkgdesc="A CD/DVD burning application for MATE Desktop"
arch=('i686' 'x86_64')
url="https://github.com/darkshram/parrillada"
license=('GPL2')
groups=('mate-extra')
depends=('mate-desktop' 'cdrkit' 'gst-plugins-base-libs' 'libtool' 'totem-plparser' 'tracker')
optdepends=('libburn: Record, erase and format CDs, DVDs and BDs'
            'libisofs: Create disk images from a selection of files'
)
makedepends=('mate-common' 'yelp-tools')
source=("https://github.com/darkshram/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('abfa23c3e395aabca9ceb6149c742a5a0d7cc9dec6b889f9382fbc935d1dd6d8')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
    _docdir=${pkgdir}/usr/share/doc/${pkgname}
    install -dpm755 ${_docdir}
    install -Dpm644 AUTHORS.md COPYING ChangeLog INSTALL MAINTAINERS.md NEWS.md README.md ${_docdir}/
    cd ${pkgdir}/usr/share/parrillada
    ln -s ../icons/hicolor/48x48/apps/parrillada.png logo.png
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh
