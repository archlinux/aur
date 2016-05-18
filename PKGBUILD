# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: adagari <adam.garibay at gmail dot com>

pkgname=ut4
pkgver=2973693
pkgrel=1
pkgdesc="Pre-Alpha of the new Unreal Tournament based on Unreal Engine 4."
arch=("x86_64")
url="https://www.epicgames.com/unrealtournament/"
license=('custom')
makedepends=('unzip')
source=(file://"UnrealTournament-Client-XAN-${pkgver}-Linux.zip"
        "UnrealTournament"
        "UnrealTournament4.desktop")
noextract=("UnrealTournament-Client-XAN-${pkgver}-Linux.zip")
sha512sums=(
    'dba70b57524d6f2fb9274c90c5c4218e55deba916245dab3d03ee23296d9e2ea1c71715f342770e7fbcf7d2ae41886b4ea4eb006d8047a1df282a6e31b112bac'
    'f0e737f9d331e938b5b3433e8e182792339e5ec804923e78beed813e472ab24a45db25c01227e42256dece7170e967f6a87795c3d4591ebcfaa876cee12249b8'
    '0d0d92628c98113b4fd7ae2ce496fd679e90b115f701979edd99e9cb89826fd647cac15402ba3467755b96173330c7b47505d32798f926803bcf1beaf73f6942'
)

prepare() {
    cd ${srcdir}
    unzip UnrealTournament-Client-XAN-${pkgver}-Linux.zip
}

package() {
    DEST="/opt"
    RPATH="${pkgdir}${DEST}"
    DPATH="${RPATH}/ut4"
    install -d "${RPATH}"
    cp -ra LinuxNoEditor "${DPATH}"

    chgrp -R games "${DPATH}"
    chmod -R a+rw "${DPATH}/UnrealTournament/Saved"

    chmod +x "${DPATH}/Engine/Binaries/Linux/UE4-Linux-Shipping"
    chmod +x "${DPATH}/Engine/Binaries/Linux/UE4-Linux-Test"

    BPATH="${pkgdir}/usr/bin"
    install -d "${BPATH}"
    install UnrealTournament "${BPATH}"
    chmod +x "${BPATH}/UnrealTournament"

    install -d "${pkgdir}/usr/share/applications/"
    sed -i "s/PATH/${PATH}/g" UnrealTournament4.desktop
    install UnrealTournament4.desktop "${pkgdir}/usr/share/applications/"
}
