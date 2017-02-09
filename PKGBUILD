# Maintainer: Chris Cromer <chris@cromer.cl>
# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Philip Müller <philm|manjaro|org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

_spkgrel=8
_repo=http://mirror.netcologne.de/archlinux/core/os

pkgbase=eudev-systemdcompat
pkgname=('eudev-systemd' 'libeudev-systemd')
pkgver=232
pkgrel=3
arch=('i686' 'x86_64')
license=('GPL2')
groups=('base' 'base-openrc')
url="http://www.freedesktop.org/wiki/Software/systemd"
source_i686=("$_repo/i686/libsystemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz"
        "$_repo/i686/systemd-$pkgver-${_spkgrel}-i686.pkg.tar.xz")
source_x86_64=("$_repo/x86_64/libsystemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz"
        "$_repo/x86_64/systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.xz")
md5sums_i686=('458867be18c7d14af34c9d4c267e5880'
              'db63aafd235f3993314e513119ec1a0b')
md5sums_x86_64=('ec7b5aea73f3ddb0e893873e86a4e51b'
                '0c9ea39248d5a24591e7b67c334d61e1')

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
