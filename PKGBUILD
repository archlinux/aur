# Maintainer: genofire <geno+dev@fireorbit.de>

_pkgname="purism-chatty"
pkgname="${_pkgname}-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1.14.r4.g8285292
pkgrel=1
pkgdesc="XMPP and SMS messaging via libpurple and Modemmanager"
url="https://source.puri.sm/Librem5/chatty"
license=('LGPL2.1')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('libhandy' 'libpurple' 'evolution-data-server' 'feedbackd')
optdepends=('libpurple-lurch: XMPP E2E OMEMO encryption'
	    'libpurple-carbons: XMPP Carbon Copy - Live multiple device support'
	    'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing'
	    'purple-mm-sms: SMS plugin using ModemManager')
makedepends=('pkg-config' 'meson')
provides=('purism-chatty')
conflicts=('purism-chatty')
source=("git+https://source.puri.sm/Librem5/chatty.git")
md5sums=(SKIP)

pkgver() {
    git -C chatty describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf build
    arch-meson chatty build -Dexamples=false -Dgtk_doc=true
    ninja -C build
}

check() {
	ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
