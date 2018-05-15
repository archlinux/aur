# Maintainer: Amadeus Folego <amadeusfolego@gmail.com>
# Maintainer: Terje Larsen <terlar@gmail.com>
# Maintainer: Ariel AxionL <axionl@aosc.io>
pkgname=oni-bin
pkgver=0.3.4
pkgrel=1
pkgdesc='Oni: Modern Modal Editing - powered by Neovim.'
arch=('x86_64')
conflicts=("oni")
provides=("oni")
url='https://github.com/onivim/oni'
license=('MIT')
depends=('nodejs' 'gconf' 'libxss' 'hicolor-icon-theme' 'neovim')
makedepends=('fontconfig' 'nss' 'nspr' 'gtk2' 'freetype2'
        'ffmpeg' 'electron' 'cairo' 'alsa-lib' 'gdk-pixbuf2' 
        'atk' 'pango' 'libxfixes' 'libxtst'  'libcups' 'libxrender'
        'libxcomposite' 'libxrandr' 'libxi' 'libxkbfile' 'libxdamage' 'libxcursor')
optdepends=('clang-tools-extra'
            'python-language-server' 
            'go-langserver-git')

source=('https://raw.githubusercontent.com/onivim/oni/master/LICENSE'
        '16x16.png'
        '32x32.png'
        '64x64.png'
        '128x128.png'
        '256x256.png'
        '512x512.png'
        'oni.desktop')
source_x86_64=("https://github.com/onivim/oni/releases/download/v$pkgver/Oni-$pkgver-x64-linux.tar.gz")

sha256sums=('a446f219aabe3667850444bbd5f11b7e931889b4d5dbf3bc074fe00f25f1124c'
            'ed91d7b57f1b88bf5e40e40ca5f557dcd8c37eeea5be6c656ac222974dc30baa'
            '1cc38f0b1243f301bcb3f8b265d9e0e6bb51eaf20bab546e8abe4eba8fcab4ff'
            'f9ca30b9817889fea4e1b4bf631c06fe483db73fea844cf771d9b61b02f636a6'
            'e01bc685dd7e85bf7bae144812c421e7209538da9f6871d38ee3383b93b864fc'
            '396c174850dcabb2add952767fd35b860d5e368a75efba4576b8a0efdc8ea719'
            '5465269347564615deae17f69e3b11307082f886086ea523d0c09c4661d3e1f2'
            'c45d6d498a797358765fce699efe7ea5a979be47d28bee65d9d3173cacd58a7c')
sha256sums_x86_64=('61db303d270dac8d6fa34afdb3512a0027b8e7d67b1ff94e8c6f266bb17b58ea')

package() {
    install -dm755 $pkgdir/opt/$pkgname
    dir=$srcdir/Oni-$pkgver-x64-linux
    install -Dm644 LICENSE $pkgdir/usr/share/license/$pkgname/LICENSE
    install -Dm644  oni.desktop $pkgdir/usr/share/applications/oni.desktop
    cp -dr --no-preserve='ownership' $dir/* $pkgdir/opt/$pkgname
    
    for i in 16x16 32x32 64x64 128x128 256x256 512x512; do
        install -Dm644 $i.png $pkgdir/usr/share/icons/hicolor/$i/apps/oni.png
    done
}