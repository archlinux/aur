# Maintainer: Thomas Holden <thomas@tholden.no>
pkgname=zenbook-sound-fix-ux3405ma
pkgver=1.0.2
pkgrel=1
pkgdesc="SSDT Patch to fix missing speakers sound in Linux on Asus Zenbook 14 UX3405MA (2024) and latest BIOS"
arch=("x86_64")
url="https://github.com/smallcms/asus_zenbook_ux3405ma"
license=("unknown")
install="asua_zenbook_ux3405ma.install"
depends=("grub")
makedepends=("git" "acpica")
source=("git+https://github.com/smallcms/asus_zenbook_ux3405ma.git")
md5sums=('SKIP')

build() {
    iasl -tc $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.dsl
}

package() {
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/ssdt-csc3551.aml $pkgdir/boot/ssdt-csc3551.aml
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/01_acpi $pkgdir/etc/grub.d/01_acpi
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/pipewire/media-session.d/alsa-monitor.conf $pkgdir/etc/pipewire/media-session.d/alsa-monitor.conf
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/pipewire/pipewire.conf.d/pwrate.conf $pkgdir/etc/pipewire/pipewire.conf.d/pwrate.conf
    # Wireplumber >= 0.5
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/wireplumber/wireplumber.conf.d/51-disable-suspension.conf $pkgdir/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.conf
    # Wireplumber < 0.5
    install -Dm755 $srcdir/asus_zenbook_ux3405ma/fix_pop_crack_pop/wireplumber/main.lua.d/51-disable-suspension.lua $pkgdir/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.lua
}
sha256sums=('SKIP')
