# Maintainer: Oliver Jaksch <arch-aur at com-in dot de>

pkgname=a7800
pkgver=5.2
pkgrel=1
pkgdesc="A7800 is a fork of the MAME Atari 7800 driver, with several enhancements added (ProSystem)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://7800.8bitdev.org/index.php/A7800_Emulator"
license=('custom:MAME License')
depends=(sdl2_ttf qt5-base lua libutf8proc pugixml portmidi portaudio)
makedepends=(nasm python glm libxinerama)
source=("https://github.com/7800-devtools/a7800/releases/download/v$pkgver/a7800-linux-v$pkgver.tgz"
	"http://7800.8bitdev.org/resources/assets/78008bitdevlogo.png"
	"a7800-starter.sh"
	"a7800.desktop")
sha256sums=('32fbdb0b033b73e4f203a0a26d60b420fa3bfc5b8f6fa70552b623f017f5047d'
            'b89310a46a5305c41f8dfb63e915aaa1e12ea74209cd6fcf7ec3e4753067ff73'
            '59e9ca8f0c028f23212dffd778ef3b2be63a716ded5bb66a50a0869700408322'
            '06b0773ebd2795fb15c9380449f6464c03414f514c6f5e5aeb25835bed000ddb')

package() {
  cd "${srcdir}/${pkgname}-linux"
  sed -i -e 's/bios;roms/bios;$HOME\/.a7800\/roms/' a7800.ini
  mkdir -p ${pkgdir}/opt/a7800
  cp -r * ${pkgdir}/opt/a7800

  install -Dm755 ../a7800-starter.sh "${pkgdir}/usr/bin/${pkgname}-starter.sh"
  install -Dm644 ../a7800.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ../78008bitdevlogo.png "${pkgdir}/usr/share/pixmaps//${pkgname}.png"
  msg2 "\e[1;32mYou have to put MAME's a7800* BIOS files to your HOME/.a7800/roms directory \e[0m"
  msg2 "\e[1;32mto use this emulator. This directory is created at first run of a7800. \e[0m"
  msg2 "\e[1;32mTo play games copy .a78 files (which needs headers) to the same directory.\e[0m"
  msg2 "\e[1;32mSee http://7800.8bitdev.org/index.php/A78_Header_Specification about the\e[0m"
  msg2 "\e[1;32mheader specs and how to add them, if neccessary.\e[0m"
}
