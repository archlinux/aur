# Maintainer: Asger Geel Weirsoe <asger at weircon dot dk>
#
# DISCLAIMER
#
# ahfail is a joke with a real screen locker underneath. Two things to know
# before installing it:
#
# 1. Security. It sits in the authentication path of your session. It is
#    provided as is, without any warranty (see the AGPL-3.0 license). On
#    Wayland a crash leaves the session locked; on X11, as with i3lock, a
#    killed locker leaves it open. /etc/pam.d/ahfail includes `login`, so
#    the system's pam_faillock policy applies to wrong guesses.
#
# 2. Media. The sprite frames and the audio clip are a parody of the
#    "ah ah ah, you didn't say the magic word" scene from Jurassic Park
#    (1993). The film and its characters belong to their respective rights
#    holders; they are used here non-commercially for parody, and the
#    AGPL-3.0 license covers the code, not those assets. Rights holders who
#    object can reach the maintainer at the address above and the assets
#    will be replaced.
#
# PROVENANCE OF THE BINARY
#
# Built by the gtk-ahfail release workflow from the tagged source, in an
# archlinux:base-devel container, with --prefix=/usr and without the Gitea
# update check. The same recipe builds the source package `ahfail`.
#
#   build recipe:  https://gitea.weircon.dk/agw/gtk-ahfail
#   download:      https://asger.weirsoe.dk/tarballz/ahfail-0.10.2-454f97eea9c0-x86_64.tar.zst

pkgname=ahfail-bin
pkgver=0.10.2
pkgrel=2
pkgdesc="Screen locker that says 'ah ah ah, you didn't say the magic word' on a wrong password (prebuilt binary)"
arch=('x86_64')
url="https://asger.weirsøe.dk/en/projects/ahfail"
license=('AGPL-3.0-only')
# gst-plugins-bad-libs: libgstplayer. gst-plugins-base/-good are runtime plugins
# (audio conversion, the mpg123 mp3 decoder) that namcap cannot see being used.
depends=('gtk3' 'gtk-session-lock' 'gstreamer' 'gst-plugins-bad-libs' 'gst-plugins-base'
         'gst-plugins-good' 'pam' 'glib2' 'gdk-pixbuf2' 'cairo' 'pango' 'at-spi2-core' 'gst-plugins-base-libs' 'glibc' 'libgcc' 'libx11')
optdepends=('pipewire-pulse: raise the volume to 100% on a failed attempt (or libpulse)'
            'libpulse: raise the volume to 100% on a failed attempt'
            'swayidle: lock automatically on Wayland'
            'xss-lock: lock automatically on X11'
            'gtklock: legacy gtklock module (/usr/lib/gtklock/ahfail-module.so)')
provides=("ahfail=$pkgver")
conflicts=('ahfail')
backup=('etc/pam.d/ahfail')
install=ahfail.install
options=('!strip' '!debug')
source=("https://asger.weirsoe.dk/tarballz/ahfail-0.10.2-454f97eea9c0-x86_64.tar.zst")
sha256sums=('454f97eea9c02a4cab7b25e91b5ac050a608c4cf0143f895d7b6b01df2d34314')

package() {
    # The tarball is a staged `meson install` tree: usr/ and etc/ at its root.
    cp -a "$srcdir/usr" "$srcdir/etc" "$pkgdir/"
}
