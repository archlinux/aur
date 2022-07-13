# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak [at] gmail [dot] com>
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
lwksver=2022.2
lwksreldir=2022.2
lwksbuild=135077
pkgver=$lwksver
pkgrel=1
pkgdesc="Lightworks is a professional video editing suite"
arch=('x86_64')
options=('!strip')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit' 'openssl-1.0')
optdepends=('nvidia-utils: only for nVidia users' 'libc++: only for BlackMagic RAW support (BRAW)' 'libc++abi: only for BlackMagic RAW support (BRAW)')
provides=('lightworks')
conflicts=('lwks-beta')
replaces=('lwks')
source=(
    "https://cdn.lwks.com/releases/$lwksreldir/lightworks_${lwksver}_r${lwksbuild}.deb"
    )

sha512sums=(
    'fabb9badfd17cc344706e1c86d779bdba9e6ceda2859201c751f32b48a066a946737650e6bd06182d9c2487a30238d7d7a243cf5cd22a6f398793b899347e613'
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
