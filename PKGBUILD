# Maintainer: Dmitriy Geels <dmitriy.geels@gmail.com>

_pkgbase=hid-logitech-k400plus
pkgname=${_pkgbase}-dkms
pkgver=0.4
pkgrel=1

pkgdesc='Modified hid-logitech-hidpp kernel module, providing native multitouch support for Logitech K400 Plus touchpad.'
arch=('any')
url='https://lore.kernel.org/linux-input/20260824180425.55809-1-dmitriy.geels@gmail.com/'
license=('GPL-2.0-only')

depends=(
    'dkms'
    'curl'
    'patch'
)

source=(
    'prepare-kernel-source.sh'
    'Makefile.hid'
    'dkms.conf'
    'k400plus-native-touchpad.patch'
)

sha256sums=('636cbdb38fe87cd4decc0661a1ef818987411563fea2f032c01c04d1b7e44d80'
            'a6a0420ad9c35682369dca6de9540c36cac4c85f5b103c60f607c2f068fafef7'
            '4be699aa8f7c833d839f538529566d5e0d566ed3776eabe9dd428676fcca96e1'
            '2f7b09978f91847fab25b8e35ab91cc7e454ddb14f4fd56030547bee62d993c4')

package()
{
    local dst="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

    install -d "${dst}"

    install -m644 \
        "${srcdir}/dkms.conf" \
        "${dst}/dkms.conf"

    sed -i \
        "s/@PKGVER@/${pkgver}/g" \
        "${dst}/dkms.conf"

    install -m755 \
        "${srcdir}/prepare-kernel-source.sh" \
        "${dst}/prepare-kernel-source.sh"

    install -m644 \
        "${srcdir}/Makefile.hid" \
        "${dst}/Makefile.hid"

    install -m644 \
        "${srcdir}/k400plus-native-touchpad.patch" \
        "${dst}/k400plus-native-touchpad.patch"
}
