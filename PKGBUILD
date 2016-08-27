# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Jupotter <jupotter.g@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Nick <nick@screamingfist.org>

pkgname=doomrl
pkgver=0.9.9.7
pkgrel=7
pkgdesc="A roguelike game based on the FPS Doom."
arch=('i686' 'x86_64')
url="http://doom.chaosforge.org/"
license=("custom")
depends=("sdl_mixer"
        "zlib"
        "lua"
        "timidity++"
        "sdl_image")

source=("LICENSE" "doomrl.sh")
source_i686=("http://doom.chaosforge.org/file_download/33/$pkgname-linux-i386-${pkgver//./}.tar.gz")
source_x86_64=("http://doom.chaosforge.org/file_download/32/$pkgname-linux-x64-${pkgver//./}.tar.gz")

sha256sums=('fa626af2c45e10e5bce4d01b3e9d0451ffc96996408880b1be77f7a5956cdf9f'
            '62549c30bad5da0b11650e8bc6a8fa16f7c0d49df9720e38926fedca0225620f')
sha256sums_i686=('6d217d697e94f5f2ce3fe8ebbedaf03fa68a5ed1140cb889921f18d8604a389f')
sha256sums_x86_64=('d9d19e4a8794efb3c23963b3e11987ebadbb7bee7350b00ce6b64eaff501e488')

case $CARCH in
  'i686')
    __arch='i386' ;;
  'x86_64')
    __arch='x64' ;;
esac

package() {
    cd "$srcdir/doomrl-linux-$__arch-${pkgver//./}"

    # Copy program and required files
    install -d "$pkgdir/usr/share/doomrl"
    cp -a * "$pkgdir/usr/share/doomrl"

    # Copy script used to run program
    install -D -m755 "$srcdir/doomrl.sh" "$pkgdir/usr/bin/doomrl"

    # Copy the license file
    install -D -m644 "$srcdir/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

