# Maintainer: Head_on_a_Stick <matthew.t.hoare at gmail dot com>

pkgname=catclock-aubio-git
_pkgname=catclock
pkgdesc="X clock, with cat mode, using aubio and pulseaudio to swing the tail to a beat"
pkgver=r34.9de77d0
pkgrel=1
arch=(x86_64)
url='https://github.com/BarkyTheDog/catclock'
license=('custom')
depends=('libx11' 'libxmu' 'libxaw' 'libxrender' 'libxft' 'libxkbfile' 'openmotif' 'pulseaudio' 'aubio')
makedepends=('xorg-util-macros' 'git')
conflicts=('xorg-xclock')
provides=('xorg-xclock')
source=('catclock::git+http://github.com/BarkyTheDog/catclock#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make WITH_TEMPO_TRACKER=1
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m 755 xclock "$pkgdir/usr/bin/xclock"
}                                                                                 
