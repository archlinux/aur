# Maintainer: nick <AUR [at] lwks [dot] com>
# Contributor: jamnor <software [at] vncompat [dot] org>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>
# Contributor: Marcin Nowak <marcin [dot] j [dot] nowak [at] gmail [dot] com>

pkgname=lightworks-beta
lwksver=2024.1
lwksreldir=$lwksver
lwksbuild=147877
pkgver=$lwksver.$lwksbuild
pkgrel=1
pkgdesc="Lightworks Beta is the public Beta branch for Lightworks, the professional video editing suite, updated weekly"
arch=('x86_64')
options=('!strip')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit' 'twolame' )
optdepends=('nvidia-utils: only for nVidia users' 'libc++: only for BlackMagic RAW support (BRAW)' 'libc++abi: only for BlackMagic RAW support (BRAW)')
provides=('lightworks')
conflicts=('lightworks' 'lwks-beta')
replaces=('lwks-beta')
source=(
    "https://cdn.lwks.com/betas/public/lightworks/${lwksver}+Beta+Revision+${lwksbuild}+%281st+October%29/Lightworks-${lwksver}-Beta-${lwksbuild}.deb"
    )

package() {
    msg2 "Extracting data.tar.xz"
    bsdtar -zxf data.tar.xz -C "$pkgdir"

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
sha256sums=('eae685e168d1af27594f67138f9d28145713e712f8655fd167b0cebce477e5f1')
