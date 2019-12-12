# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak [at] gmail [dot] com>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>

pkgname=lwks-beta
lwksstage=Beta  # beta/rc1/rc2/etc..
lwksver=2020.1
lwksbuild=118776
pkgver=$lwksver.$lwksbuild
pkgrel=1
pkgdesc="Lightworks is a professional video editing suite"
arch=('x86_64')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
provides=('lightworks')
conflicts=('lightworks' 'lwks')
source=(
    "http://downloads.lwks.com/Lightworks-$lwksver-$lwksstage-$lwksbuild.deb"
    )

sha256sums=(
    'db4615b9b555a24e0e69faf50b35b0d59181b8035e0670ae195a6f46537c7580'
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
