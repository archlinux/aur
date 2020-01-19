# Maintainer: André Fettouhi a.fettouhi at gmail com
# Contributor: Nicolas Bigaouette nbigaouette at gmail com

pkgname=acpi-eeepc-generic
pkgver=1.0.2
pkgrel=4
pkgdesc="ACPI scripts for many EeePC netbook computers"
url="https://github.com/nbigaouette/acpi-eeepc-generic"
arch=(any)
license=(GPL3)
depends=(acpid xorg-apps dmidecode)
optdepends=(
    "unclutter: Hide cursor when touchpad is disabled"
    "kdebase-runtime: KDE's super-user privileges gaining"
    "sudo: super-user privileges gaining"
    "gksu: GNOME/GTK super-user privileges gaining"
    "pm-utils: Power management (suspend and hibernate) utilities"
)
install=acpi-eeepc-generic.install
backup=(etc/conf.d/acpi-eeepc-generic.conf)
conflicts=("acpi-eee" "acpi-eee900" "acpi-eee901" "acpi-eee1000" "acpi-eeepc900" "buttons-eee901" "e3acpi" "eee-control" "eee-fan")
source=(
    "acpi-eeepc-generic-events"
    "acpi-eeepc-defaults-events.conf"
    "acpi-eeepc-1000-events.conf"
    "acpi-eeepc-1000HD-events.conf"
    "acpi-eeepc-1000HE-events.conf"
    "acpi-eeepc-1000H-events.conf"
    "acpi-eeepc-1001P-events.conf"
    "acpi-eeepc-1001PX-events.conf"
    "acpi-eeepc-1005HA-events.conf"
    "acpi-eeepc-1005-HA-H-events.conf"
    "acpi-eeepc-1005HAG-events.conf"
    "acpi-eeepc-1005PE-events.conf"
    "acpi-eeepc-1005PEB-events.conf"
    "acpi-eeepc-1005P-events.conf"
    "acpi-eeepc-1005PX-events.conf"
    "acpi-eeepc-1005PXD-events.conf"
    "acpi-eeepc-1008HA-events.conf"
    "acpi-eeepc-1015B-events.conf"
    "acpi-eeepc-1015P-events.conf"
    "acpi-eeepc-1015PEM-events.conf"
    "acpi-eeepc-1015T-events.conf"
    "acpi-eeepc-1201HA-events.conf"
    "acpi-eeepc-1201N-events.conf"
    "acpi-eeepc-1201PN-events.conf"
    "acpi-eeepc-1201NL-events.conf"
    "acpi-eeepc-1215N-events.conf"
    "acpi-eeepc-1215B-events.conf"
    "acpi-eeepc-700-events.conf"
    "acpi-eeepc-701-events.conf"
    "acpi-eeepc-900A-events.conf"
    "acpi-eeepc-900-events.conf"
    "acpi-eeepc-901-events.conf"
    "acpi-eeepc-904HD-events.conf"
    "acpi-eeepc-S101-events.conf"
    "acpi-eeepc-T101MT-events.conf"
    "acpi-eeepc-T91MT-events.conf"
    "acpi-eeepc-X101H-events.conf"
    "acpi-eeepc-generic-functions.sh"
    "acpi-eeepc-generic-handler.sh"
    "acpi-eeepc-generic-logsbackup.rcd"
    "acpi-eeepc-generic-restore.rcd"
    "acpi-eeepc-generic-rotate-lvds.sh"
    "acpi-eeepc-generic-suspend2ram.sh"
    "acpi-eeepc-generic-toggle-bluetooth.sh"
    "acpi-eeepc-generic-toggle-cardr.sh"
    "acpi-eeepc-generic-toggle-displays.sh"
    "acpi-eeepc-generic-toggle-lock-suspend.sh"
    "acpi-eeepc-generic-toggle-resolution.sh"
    "acpi-eeepc-generic-toggle-she.sh"
    "acpi-eeepc-generic-toggle-touchpad.sh"
    "acpi-eeepc-generic-toggle-webcam.sh"
    "acpi-eeepc-generic-toggle-wifi.sh"
    "acpi-eeepc-generic.conf")

package() {
    mkdir -p $pkgdir/{etc/{acpi/{eeepc/models,events},conf.d,rc.d},usr/share/{applications,pixmaps}} || return 1

    # Install our own handler
    install -m0755 ${srcdir}/acpi-eeepc-generic-handler.sh ${pkgdir}/etc/acpi/acpi-eeepc-generic-handler.sh || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-functions.sh ${pkgdir}/etc/acpi/eeepc/acpi-eeepc-generic-functions.sh || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-events ${pkgdir}/etc/acpi/events/acpi-eeepc-generic-events || return 1

    install -m0644 ${srcdir}/acpi-eeepc-generic.conf ${pkgdir}/etc/conf.d/acpi-eeepc-generic.conf || return 1

    # Install events configuration files for each model
    for f in ${srcdir}/acpi-eeepc-*-events.conf; do
        install -m0644 $f ${pkgdir}/etc/acpi/eeepc/models || return 1
    done

    install -m0755 ${srcdir}/acpi-eeepc-generic-restore.rcd ${pkgdir}/etc/rc.d/eeepc-restore || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-logsbackup.rcd ${pkgdir}/etc/rc.d/logsbackup || return 1

    # Helper scripts
    install -m0755 ${srcdir}/acpi-eeepc-generic-rotate-lvds.sh ${pkgdir}/etc/acpi/eeepc || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-suspend2ram.sh ${pkgdir}/etc/acpi/eeepc || return 1
    for f in ${srcdir}/acpi-eeepc-generic-toggle-*.sh; do
        install -m0755 $f ${pkgdir}/etc/acpi/eeepc || return 1
    done
}

sha256sums=('5baf7e533c3292411cbd3a54455e2405be242cb4c251f6f9b718f54922e057ca'
            '27d8bfbdd86146c04c5fca97d01438e6a11ebb46cc63ed3136f066d6fc95ad9f'
            'b5e805c8e754613a89a2ad7059562fb43aaac3dc2851f3fb3a6bf0369680ec15'
            'b5e805c8e754613a89a2ad7059562fb43aaac3dc2851f3fb3a6bf0369680ec15'
            'c2fed04c1f909ee01a3741f8e4285b3c0ae81db3389a93cceed972b680859a7f'
            'b5e805c8e754613a89a2ad7059562fb43aaac3dc2851f3fb3a6bf0369680ec15'
            '7e3efd585abe9916ffd90634b1795f127b60bc5c005220f1c40f38cc16aed8ab'
            'e861cee3b7ec83512c8e5776f72a5d9514a1c230da87e41500a02873a140170d'
            '7e3efd585abe9916ffd90634b1795f127b60bc5c005220f1c40f38cc16aed8ab'
            '10ccdc92b54a8c12e6aff377b5b41dfbe2fbd42acd321961e78de2e602c819a3'
            '7e3efd585abe9916ffd90634b1795f127b60bc5c005220f1c40f38cc16aed8ab'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '7e3efd585abe9916ffd90634b1795f127b60bc5c005220f1c40f38cc16aed8ab'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '53367ca3d5056318507e5d6a22177d83fac37db3f7100d4023baaeea9fb2b152'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '3ba29518f78589a55794047ae5cb499131ceb168fe79032db19ed9b82d8a4ffc'
            '3ba29518f78589a55794047ae5cb499131ceb168fe79032db19ed9b82d8a4ffc'
            '18ab9bdceea55d9460ed1305d2775f992d119e37ea99913856fba827356a0d99'
            '417b5887be74f92ca4696c56fc7cf396c3a2bd293286ef0e150a31842d094b38'
            'bc8a5d152b00f6a893da97349eb16dcafb84d3f805c4c85656a390d225f17af6'
            'f78685fcea35bf33759a05a297a4772ab6e3c7d0233ca69573e4331896c27d9e'
            'f00945d10ddf3bf7b2967e14acee85ef185928b6878607a1e32c0c618517a24d'
            '738d2762cb31825a145100f84f2e5c8df9b67ffac6f8427c4f139aef2c8634c4'
            '738d2762cb31825a145100f84f2e5c8df9b67ffac6f8427c4f139aef2c8634c4'
            '45ee0bcf89e059ed2b4b63a5b86cb69ef8fb7d2a0e8dd3e749c6670837874d8f'
            '9e2957ae2285a1b2a7ba20c2e654e6e51007332dd8d753677d5ae62aaeab11cb'
            'c0cae32766c5c8a7533ece16a44e3a9073e8bde7c19c5b521770085ce311ad03'
            'ee802009dec7ef5ad891b324cfb58af62c34595bbf7306ec9dd4b29d08e2e05a'
            'f365dc3f8755502629b5659e01518a507e90ebf148346b9b00009246261166ae'
            '524cfd1ebdfcc8f0b629360a6d0d4927c139dc7cd6b586ebd43cadf8865916fe'
            '7f21b811b246213edb070a1409b322c8107a54056d065609c9ab5c37c5cdbdcf'
            '0dd10853477c736038e8b222eabde736c18a63545e5ba0a5afe79e790ef2712f'
            '534d607f7f91fe3d1aaf0e073424df65da0115bbee35a34b23748e9e583d9a36'
            '2b654b0403fc39396cfdd5da21e701a149ffaa56afb683936389793fa16364ee'
            '8ea1efdf4fc6ec4658db12ec7054cf46f8bd59f3d745ea8d0cd604a91ac79382'
            '3d3ae3b50755ca402b4e268cc4e20a8b129fca9e3ff09583834e89856536c2db'
            'ac7fead818cdc33d4157dcade7afb948bd841380fb1b59eab04784b2d217b867'
            'f76e65c6403a99480e6df35389c6700030239bb07a5d1b71c8069ad860c9efe8'
            '10b2dcb4e66b111f3a30bde196e171065236e292bfea20a333626c4649a841e3'
            '14d7f714f4f7ec409dedb3461431631811af3ffc13db7fbc3efeb8313e623b52'
            '7b48dcfcb4a1af44035194668190608b291b43ade045f4a2382d30bc1ef10d0d')
