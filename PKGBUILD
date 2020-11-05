# Maintaoner: Yamada Hayao <development@fascode.net>

android_ver="9.0"
android_codename="pie"
android_revision="r2"
pkgrel=1

pkgname="android-x86-${android_codename}"
pkgver="${android_revision}"
pkgdesc="This is a project to port Android open source project to x86 platform."
arch=('any')
url="https://www.android-x86.org/"
license=('Apache')
depends=()
makedepends=()

install="${pkgname}.install"

backup=(
    "android-${android_ver}-${android_revision}/initrd.img"
    "android-${android_ver}-${android_revision}/kernel"
    "android-${android_ver}-${android_revision}/ramdisk.img"
    "android-${android_ver}-${android_revision}/system.sfs"
)

# i686
source_i686=(
    "android-x86-9.0-r2.i686.rpm::https://osdn.net/projects/android-x86/downloads/71931/android-x86-9.0-r2.i686.rpm/"
)
md5sums_i686=('SKIP')

#x86_64
source_x86_64=(
    "android-x86-9.0-r2.x86_64.rpm::https://osdn.net/projects/android-x86/downloads/71931/android-x86-9.0-r2.x86_64.rpm/"
)
md5sums_x86_64=('SKIP')


package() {
    install -D -m 755 "${srcdir}/usr/bin/qemu-android" "${pkgdir}/usr/bin/qemu-android-${android_codename}"

    local file
    for file in "${srcdir}/android-${android_ver}-${android_revision}/"*; do
        install -D -m 755 "${file}" "${pkgdir}/android-${android_ver}-${android_revision}/$(basename "${file}")"
    done
}
