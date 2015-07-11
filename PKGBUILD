# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Jupotter <jupotter.g@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Nick <nick@screamingfist.org>

pkgname=doomrl
pkgver=0.9.9.7
pkgrel=1
pkgdesc="A roguelike game based on the FPS Doom."
arch=('i686' 'x86_64')
url="http://doom.chaosforge.org/"
license=("custom")
depends=("sdl_mixer"
        "zlib"
        "lua"
        "timidity++"
        "sdl_image")
conflicts=("doomrl-lq doomrl-ogg")

case $CARCH in
  'i686')
    source=("http://doom.chaosforge.org/file_download/33/doomrl-linux-i386-0997.tar.gz"
            "doomrl" "LICENSE")
    md5sums=('f1beebc47c63a768752ea66951799f45'
            '825cac701303cd5c61ec209e461219de'
            'eaa0c779f98be421bf34cd0c5800642a')
    __arch='i386' ;;
  'x86_64')
    source=("http://doom.chaosforge.org/file_download/32/doomrl-linux-x64-0997.tar.gz"
            "doomrl" "LICENSE")
    md5sums=('7078b52000b91c468a0041ff667c4f81'
            '825cac701303cd5c61ec209e461219de'
            'eaa0c779f98be421bf34cd0c5800642a')
    __arch='x64' ;;
esac


package() {
    cd "$srcdir/doomrl-linux-$__arch-${pkgver//./}"

    # Copy program and required files
    install -d "$pkgdir/usr/share/doomrl"
    cp -a * "$pkgdir/usr/share/doomrl"

    # Copy script used to run program
    install -D -m755 "$srcdir/doomrl" "$pkgdir/usr/bin/doomrl"

    # Copy the license file
    install -D -m644 "$srcdir/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # This is needed to save games and scores
    chmod 4755 "$pkgdir/usr/share/doomrl/doomrl"
}

