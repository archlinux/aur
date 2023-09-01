# Maintainer: jamnor <software [at] vncompat [dot] org>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>
# Contributor: Marcin Nowak <marcin [dot] j [dot] nowak [at] gmail [dot] com>

pkgname=lwks-beta
lwksver=2023.2
lwksbuild=141946
lwksdate="31st%20August"
pkgver=$lwksver
pkgrel=1
pkgdesc="Lightworks Beta is the public Beta branch for Lightworks, the professional video editing suite, updated weekly"
arch=('x86_64')
options=('!strip')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
provides=('lwks-beta')
conflicts=('lightworks')
replaces=('lwks-beta')
source=(
    "https://lwks.s3.amazonaws.com/betas/public/lightworks/${lwksver}%20Beta%20Revision%20${lwksbuild}%20%28${lwksdate}%29/Lightworks-${lwksver}-Beta-${lwksbuild}.deb"
    )

sha512sums=(
    '9eb8fabd4fb41f2dc3ee8279b0c885a3bdc26acca1044734a253226a07e271fa8a723e0b0d4f72a32b87c6ff39cee7845b0c30454c5e68702b33676ea7f4aad0'
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
