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

pkgname=lightworks-beta
lwksver=2023.2
lwksbuild=142600
pkgver=$lwksver
pkgrel=1
pkgdesc="Lightworks Beta is the public Beta branch for Lightworks, the professional video editing suite, updated weekly"
arch=('x86_64')
options=('!strip')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
provides=('lightworks')
conflicts=('lightworks' 'lwks-beta')
replaces=('lwks-beta')
source=(
    "https://cdn.lwks.com/releases/${lwksver}/lightworks_${lwksver}_r${lwksbuild}.deb"
    )

sha512sums=(
    '0d5857a37a9958e8e9ea7340de5771abb35847616f270784e828a3f1f7c92b9fea07547d6333608444701addff7c75a11d60cc144f1bef3c2077f89a8217fbb6'
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
