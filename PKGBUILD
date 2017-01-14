# Maintainer: Chris Cromer <chris@cromer.cl>
# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Philip Müller <philm|manjaro|org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_spkgrel=7
_repo=http://mirror.netcologne.de/archlinux/core/os

pkgbase=eudev-systemdcompat
pkgname=('eudev-systemd' 'libeudev-systemd')
pkgver=232
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
groups=('base' 'base-openrc')
url="http://www.freedesktop.org/wiki/Software/systemd"
source_i686=("$_repo/i686/libsystemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz"
        "$_repo/i686/systemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz")
source_x86_64=("$_repo/x86_64/libsystemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
        "$_repo/x86_64/systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz")
sha256sums_i686=('6c9329af5749f221facd36f1cf0f065ac4522a071487414747c277b70efa7125'
                 'ac8f895095ebe93e52bec2eb853f68498f98e48352acf20aca720599986f5c29')
sha256sums_x86_64=('3ec899af9dee85b96e5c58c77df45e7301d58a1835ad2854fca425b2ae8a4191'
                   '9452691b5ba4b422e4781ece876078258974bd162a46d76cd294cf3e8b571fb1')

package_eudev-systemd() {
    pkgdesc="systemd-sysuser and systemd-tmpfiles binary; systemd compatibility package"
    provides=("systemd=${pkgver}" "systemd-tools=${pkgver}")
    depends=('eudev' 'libseccomp')
    conflicts=('systemd-tools' 'systemd' 'eudev-systemdcompat')
    replaces=('eudev-systemdcompat')

    install -d "$pkgdir"/usr/{bin,lib/systemd}
    for f in usr/bin/{systemd-tmpfiles,systemd-sysusers};do
        mv -v $f "$pkgdir"/usr/bin
    done
    for f in usr/lib/systemd/libsystemd-shared*.so*;do
        mv -v $f $pkgdir/usr/lib/systemd
    done
}

package_libeudev-systemd() {
    pkgdesc="systemd client libraries without udev; systemd compatibility package"
    provides=("libsystemd=${pkgver}" 'libsystemd.so')
    depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz' 'libeudev')
    conflicts=('libsystemd' 'eudev-systemdcompat')
    replaces=('eudev-systemdcompat')

    install -d $pkgdir/usr/lib
    for f in usr/lib/libsystemd*.so*;do
        mv -v $f $pkgdir/usr/lib
    done
}
