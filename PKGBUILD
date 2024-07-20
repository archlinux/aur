# Originally: Ultraleap <info@ultraleap.com>
# Maintainer: Sam Bilbow <samuel.bilbow@icloud.com>
pkgname=ultraleap-hand-tracking-service
pkgver=5.17.1.0_a9f25232
pkgrel=2
epoch=
pkgdesc="Ultraleap Hand Tracking service and SDK for development."
arch=("x86_64")
url="https://www.ultraleap.com/"
license=('PROPRIETARY')
groups=('ultraleap-hand-tracking')
depends=('gcc-libs>=12.2.0-1' 'glibc' 'psmisc>=23.3-1')
makedepends=()
checkdepends=()
optdepends=()
provides=('ultraleap-hand-tracking-service')
conflicts=()
replaces=()
backup=()
options=()
install='ultraleap-hand-tracking-service.install'
changelog=
source=('https://repo.ultraleap.com/apt/pool/main/u/ultraleap-hand-tracking-service/ultraleap-hand-tracking-service_5.17.1.0-a9f25232-1.0_amd64.deb'
        'analytics_config.json'
        'ultraleap-hand-tracking-service.conf'
        'leap.conf'
        'leap-tmpfiles.conf')
noextract=()
md5sums=('9161434c093d6a4a3cbaf759929bec3c'
         '4366790d2e555633b24c14cc49584e97'
         'c85e250132a9b3bc32e1c9db449fdbec'
         '9045bc8cc05aa0cbeb66621075a88162'
         'c938d73d2310f1a2f584ea144eda593e')
validpgpkeys=()

prepare() {
    tar xzf "data.tar.gz"

    # Remove last line to replace it with something more sensible
    sed -i '$ d' "${srcdir}/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake"
    echo "include(/usr/lib/cmake/LeapC/LeapCTargets.cmake)" >> "${srcdir}/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake"
}

package() {
    install -D -m644 "${srcdir}/etc/ultraleap/hand_tracker_config.json" "${pkgdir}/etc/ultraleap/hand_tracker_config.json"
    install -D -m644 "${srcdir}/analytics_config.json" "${pkgdir}/etc/ultraleap/analytics_config.json"

    install -D -m644 "${srcdir}/ultraleap-hand-tracking-service.conf" "${pkgdir}/etc/ld.so.conf.d/ultraleap-hand-tracking-service.conf"

    install -D -m644 "${srcdir}/lib/systemd/system/ultraleap-hand-tracking-service.service" "${pkgdir}/usr/lib/systemd/system/ultraleap-hand-tracking-service.service"
    install -D -m644 "${srcdir}/lib/udev/rules.d/99-SIR170.rules" "${pkgdir}/usr/lib/udev/rules.d/99-SIR170.rules"
    install -D -m644 "${srcdir}/lib/udev/rules.d/99-LMC.rules" "${pkgdir}/usr/lib/udev/rules.d/99-LMC.rules"
    install -D -m644 "${srcdir}/lib/udev/rules.d/99-LMC2.rules" "${pkgdir}/usr/lib/udev/rules.d/99-LMC2.rules"

    install -D -m755 "${srcdir}/usr/bin/leapctl" "${pkgdir}/usr/bin/leapctl"
    install -D -m755 "${srcdir}/usr/bin/leapd" "${pkgdir}/usr/bin/leapd"

    install -D -m644 "${srcdir}/usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so.0.1.1" "${pkgdir}/usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so.0.1.1"
    install -D -m644 "${srcdir}/usr/lib/ultraleap-hand-tracking-service/libLeapC.so.5" "${pkgdir}/usr/lib/ultraleap-hand-tracking-service/libLeapC.so.5"

    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-426392.ldat" "${pkgdir}/usr/share/ultraleap/ldat-426392.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-426437.ldat" "${pkgdir}/usr/share/ultraleap/ldat-426437.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-426643.ldat" "${pkgdir}/usr/share/ultraleap/ldat-426643.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-429281.ldat" "${pkgdir}/usr/share/ultraleap/ldat-429281.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-429419.ldat" "${pkgdir}/usr/share/ultraleap/ldat-429419.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-430152.ldat" "${pkgdir}/usr/share/ultraleap/ldat-430152.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-430856.ldat" "${pkgdir}/usr/share/ultraleap/ldat-430856.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-430861.ldat" "${pkgdir}/usr/share/ultraleap/ldat-430861.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-431319.ldat" "${pkgdir}/usr/share/ultraleap/ldat-431319.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/ldat-432858.ldat" "${pkgdir}/usr/share/ultraleap/ldat-432858.ldat"

    install -D -m644 "${srcdir}/usr/share/ultraleap/firmware/CyPeripheral-1.7.0.ldat" "${pkgdir}/usr/share/ultraleap/firmware/CyPeripheral-1.7.0.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/firmware/leap2_v3.8.6.ldat" "${pkgdir}/usr/share/ultraleap/firmware/leap2_v3.8.6.ldat"
    install -D -m644 "${srcdir}/usr/share/ultraleap/firmware/SIR170_v3.8.6.ldat" "${pkgdir}/usr/share/ultraleap/firmware/SIR170_v3.8.6.ldat"

    install -D -m644 "${srcdir}/usr/lib/ultraleap-hand-tracking-service/cmake/LeapCTargets.cmake" "${pkgdir}/usr/lib/cmake/LeapC/LeapCTargets.cmake"
    install -D -m644 "${srcdir}/usr/lib/ultraleap-hand-tracking-service/cmake/LeapCTargets-release.cmake" "${pkgdir}/usr/lib/cmake/LeapC/LeapCTargets-release.cmake"

    install -D -m644 "${srcdir}/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-config.cmake" "${pkgdir}/usr/lib/cmake/leapsdk-config/leapsdk-config.cmake"
    install -D -m644 "${srcdir}/usr/lib/x86_64-linux-gnu/cmake/LeapSDK/leapsdk-configVersion.cmake" "${pkgdir}/usr/lib/cmake/leapsdk-config/leapsdk-configVersion.cmake"

    install -D -m644 "${srcdir}/usr/include/LeapC.h" "${pkgdir}/usr/include/LeapC.h"

    install -D -m644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-service/copyright" "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-service/copyright"
    install -D -m644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-service/LICENSE.md" "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-service/LICENSE.md"
    install -D -m644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-service/README.md" "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-service/README.md"
    install -D -m644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-service/ThirdPartyNotices.md" "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-service/ThirdPartyNotices.md"
    install -D -m644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-service/UltraleapEULA.pdf" "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-service/UltraleapEULA.pdf"

    install -D -m644 "${srcdir}/usr/lib/ultraleap-hand-tracking-service/LICENSE.protobuf" "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-service/LICENSE.protobuf"

    install -D -m644 "${srcdir}/leap.conf" "${pkgdir}/usr/lib/sysusers.d/leap.conf"
    install -D -m644 "${srcdir}/leap-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/leap.conf"

    cd "${pkgdir}/usr/lib/ultraleap-hand-tracking-service"
    ln -s "liblibrealuvc.so.0.1.1" "${pkgdir}/usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so.0"
    ln -s "liblibrealuvc.so.0" "${pkgdir}/usr/lib/ultraleap-hand-tracking-service/liblibrealuvc.so"
    ln -s "libLeapC.so.5" "${pkgdir}/usr/lib/ultraleap-hand-tracking-service/libLeapC.so"
}
