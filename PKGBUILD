# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: schuay <jakob.gruber@gmail.com>
# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=pcsxr
pkgver=1.9.93
pkgrel=5
pkgdesc='A Sony PlayStation (PSX) emulator based on the PCSX-df project'
arch=('x86_64')
url='http://pcsxr.codeplex.com/'
license=('GPL')
depends=('libcdio' 'libxv' 'sdl' 'gtk3')
depends_x86_64=('lib32-libcdio' 'lib32-libxv' 'lib32-sdl' 'lib32-gtk3')
makedepends=('mesa' 'intltool' 'nasm')
makedepends_x86_64=('lib32-mesa')
optdepends_x86_64=('lib32-libpulse: Pulseaudio support'
                   'lib32-alsa-plugins: ALSA support')
optdepends_i686=('libpulse: Pulseaudio support'
                 'alsa-plugins: ALSA support')

# Accessible through /srv/ftp/other/community on nymeria.
source=("https://sources.archlinux.org/other/community/pcsxr/pcsxr-${pkgver}.tar.bz2")

build() {
    cd "$srcdir/$pkgname"

    if [[ $CARCH == 'x86_64' ]]; then
        export CC="gcc -m32"
        export CXX="g++ -m32"
    fi

    autoreconf -f -i
    intltoolize --force

    ./configure --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-dynarec=x86 \
        --enable-libcdio \
        --enable-opengl
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}

md5sums=('d75725b4c3fcb2cb11d39b3ace10dc31')
