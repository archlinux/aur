# Maintainer: Doug Penner <darwinsurvivor at gmail dot com>
# Contributor: gimx package: Stefan Mayer <stevijo.mayer at gmail dot com>
pkgname=gimx-git
pkgver=8.0
pkgrel=2
pkgdesc='Game Input Multiplexer'
arch=('any')
url='https://blog.gimx.fr'
license=('GPLv3')
depends=('wxgtk2' 'ncurses' 'xterm' 'xdg-utils' 'curl' 'openssl' 'libx11' 'libxi' 'mhash' 'bluez-libs')
makedepends=('wxgtk2' 'gettext')
conflicts=('gimx')
source=('git+https://github.com/matlo/gimx.git#tag=v8.0'
        'ncurses.patch'
        'skip-bdaddr.patch'
        'git+https://github.com/matlo/gimx-adapter-protocol.git'
        'git+https://github.com/matlo/gimx-network-protocol.git'
        'git+https://github.com/matlo/gimxcommon.git'
        'git+https://github.com/matlo/gimxfile.git'
        'git+https://github.com/matlo/gimxhid.git'
        'git+https://github.com/matlo/gimxinput.git'
        'git+https://github.com/matlo/gimxlog.git'
        'git+https://github.com/matlo/gimxpoll.git'
        'git+https://github.com/matlo/gimxprio.git'
        'git+https://github.com/matlo/gimxserial.git'
        'git+https://github.com/matlo/gimxtime.git'
        'git+https://github.com/matlo/gimxtimer.git'
        'git+https://github.com/matlo/gimxudp.git'
        'git+https://github.com/matlo/gimxuhid.git'
        'git+https://github.com/matlo/gimxusb.git'
)

sha256sums=('SKIP'
            '5ca4bab75b2057416da8a6a804a2a9f398cc229fee496f7a191f2e2612e11b8b'
            '691d672f579ecdaec55eba3d38cba5b97e016d730e555c4bcc5413def881be02'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
    cd ${srcdir}/gimx
    patch -p1 < ../'ncurses.patch'
    patch -p1 < ../'skip-bdaddr.patch'
    git submodule init
    git config submodule.gimx-adapter-protocol.url $srcdir/gimx/shared/gimx-adapter-protocol
    git config submodule.gimx-network-protocol.url $srcdir/gimx/shared/gimx-network-protocol
    git config submodule.gimxcommon.url $srcdir/gimx/shared/gimxcommon
    git config submodule.gimxfile.url $srcdir/gimx/shared/gimxfile
    git config submodule.gimxhid.url $srcdir/gimx/shared/gimxhid
    git config submodule.gimxinput.url $srcdir/gimx/shared/gimxinput
    git config submodule.gimxlog.url $srcdir/gimx/shared/gimxlog
    git config submodule.gimxpoll.url $srcdir/gimx/shared/gimxpoll
    git config submodule.gimxprio.url $srcdir/gimx/shared/gimxprio
    git config submodule.gimxserial.url $srcdir/gimx/shared/gimxserial
    git config submodule.gimxtime.url $srcdir/gimx/shared/gimxtime
    git config submodule.gimxtimer.url $srcdir/gimx/shared/gimxtimer
    git config submodule.gimxudp.url $srcdir/gimx/shared/gimxudp
    git config submodule.gimxuhid.url $srcdir/gimx/shared/gimxuhid
    git config gimxusb.url $srcdir/gimx/shared/gimxusb
    git submodule update
}

build() {
    cd ${srcdir}/gimx
    make
}

package() {
    cd ${srcdir}/gimx
    make install DESTDIR=${pkgdir}
}
