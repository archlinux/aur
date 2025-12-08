# Maintainer: Nick Walsh <nick [dot] walsh [at] lwks [dot] com>
# Contributor: Marcin Nowak <marcin [dot] j [dot] nowak [at] gmail [dot] com>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>
# Contributor: anthrit <anthrit [at] anthware [dot] com>

pkgname=lightworks
lwksver=2025.2
lwksreldir=$lwksver
lwksbuild=56344
pkgver=$lwksver.$lwksbuild
pkgrel=1
pkgdesc="Lightworks is a professional video editing suite"
arch=('x86_64')
options=('!strip')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit' twolame)
optdepends=('nvidia-utils: only for nVidia users' 'libc++: only for BlackMagic RAW support (BRAW)' 'libc++abi: only for BlackMagic RAW support (BRAW)')
conflicts=('lwks-beta')
replaces=('lwks')
source=(
    "https://cdn.lwks.com/releases/$lwksreldir/Lightworks-${lwksver}-${lwksbuild}.deb"
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
sha256sums=('07a396a4fad6a3b05a82012ff2889310e7bae739a5d4f46b0f3da9d6917f5a28')
