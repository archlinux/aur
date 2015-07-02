# Maintainer: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>

pkgname=lwks
pkgver=12.0.2
pkgrel=1
pkgdesc="Lightworks is a professional video editing suite"
arch=('x86_64')
url="http://www.lwks.com/"
license=('custom')
depends=('gtk3' 'portaudio' 'libgl' 'glu' 'ffmpeg-compat' 'libedit' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
provides=('lightworks')
conflicts=('lightworks')
source=("http://www.lwks.com/dmpub/lwks-$pkgver-amd64.deb")
sha256sums=('a6daf4ad7043d4dc9a0fcf78e572572ef85528ebe91dad72d700f466e01d37bc')

package() {
	msg2 "Extracting data.tar.gz"
	bsdtar -zxf data.tar.gz -C "$pkgdir"

	msg2 "Moving udev folder from /lib to /usr/lib"
	mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib
	rmdir "$pkgdir"/lib

	msg2 "Copying copyright file and creating a license dir"
	install -Dm644 "$pkgdir"/usr/share/doc/lightworks/copyright \
	"$pkgdir"/usr/share/licenses/lightworks/copyright
	ln -sr "$pkgdir"/usr/share/licenses/lightworks "$pkgdir"/usr/share/licenses/$pkgname

	msg2 "Changing some needed permissions"
	chmod a+rw "$pkgdir"/usr/share/lightworks/Preferences
	chmod a+rw "$pkgdir"/usr/share/lightworks/"Audio Mixes"
}
