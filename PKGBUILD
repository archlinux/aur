# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: speps <speps at aur dot archlinux dot org>

_name="autokey"
pkgname="${_name}-data-xdg"
pkgver=0.90.4
pkgrel=2
pkgdesc="A text expansion/replacement and hotkey utility for Linux and X11, with XDG basedir patch."
arch=("any")
url="http://code.google.com/p/${_name}/"
license=("GPL3")
depends=("hicolor-icon-theme"
         "python2-dbus"
	 "python2-pyinotify"
         "python2-xlib"
         "wmctrl"
	 "zenity")
optdepends=("pyatspi: at-spi support")
conflicts=("${_name}" "${_name}-data")
provides=("${_name}-data=${pkgver}")
install="${pkgname}.install"
source=("https://autokey.googlecode.com/files/${_name}-${pkgver}.tar.gz"
        "${_name}.xdg.patch")
sha256sums=("7352c94ca984f1ba049f0b0d832abe47005cf65567904e5404c73e90358117e4"
            "8ceecd4202b01b46c2eb368f1c38e33e958941b265f6a23b701961f731fbc0c7")

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -p1 -i "${srcdir}/${_name}.xdg.patch"
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root=${pkgdir} --optimize=1
    # remove GUI stuff
    rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/${_name}/{gtk,qt}*
    rm -rf ${pkgdir}/usr/share/{kde4,applications}
    rm -f ${pkgdir}/usr/{bin,share/man/man1}/${_name}-{gtk,qt}*
}
