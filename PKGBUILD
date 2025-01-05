# Maintainer: robertfoster
# Maintainer: XenGi

pkgbase="unrealtournament-bonuspacks"
pkgname=("unrealtournament-bonuspack1" "unrealtournament-bonuspack2" "unrealtournament-bonuspack3" "unrealtournament-bonuspack4")
pkgver=20250105
pkgrel=1
arch=("i686" "x86_64")
url="http://www.unrealtournament2004.com/utgoty/"
license=("custom")
groups=("unrealtournament" "unrealtournament-bonuspacks")
depends=("unrealtournament")
makedepends=("umodunpack")
source=("ut99-bonuspacks.zip::https://archive.org/download/UT-Bonus-Packs/Unreal%20tournament.zip"
        "unrealtournament-bonuspack2.install"
        "unrealtournament-bonuspack4.install")
sha256sums=("0c4361bc9ee71fcd4b52ca6c0cb8754cece655dee82eeb7995994495dc440fe1"
            "e680c71d08f7deda634aa51903911d76aa158ac3cf34c7a5d9fc7dd6ef4563eb"
            "ef3b336730fbf605c0f01376d75228069deeabfa04623f5ef35200acebda2b77")

package_unrealtournament-bonuspack1() {
    pkgname="unrealtournament-bonuspack1"
    pkgdesc="Bonuspack 1: The Epic Pack for Unreal Tournament."
    conflicts=(ut1999-bonuspack1)
    install=unrealtournament-bonuspack1.install

    cd "${srcdir}/Unreal Tournament Bonus Pack 1"

    install --directory -m775 -- ${pkgdir}/opt/ut/{System,Textures}
    umodunpack --base ${pkgdir}/opt/ut --unpack UTBonusPack.umod || return 1
    mv -f -t ${pkgdir}/opt/ut/System -- ${pkgdir}/opt/ut/system/*
    mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    rm -rf -- ${pkgdir}/opt/ut/{system,textures}
}

package_unrealtournament-bonuspack2() {
    pkgname="unrealtournament-bonuspack2"
    pkgdesc="Bonuspack 2: The Digital Extremes Pack for Unreal Tournament."
    conflicts=(ut1999-bonuspack2)
    install=unrealtournament-bonuspack2.install

    cd "${srcdir}/Unreal Tournament Bonus Pack 2"

    install --mode=644 -D -- CTF-HallOfGiants.unr "$pkgdir/opt/ut/Maps/CTF-HallOfGiants.unr" || return 1
    install --mode=644 -D -- CTF-Orbital.unr "$pkgdir/opt/ut/Maps/CTF-Orbital.unr" || return 1
    # Cannot unpack directly. Umodpack wants to apply some .ini changes.
    umodunpack --base "$pkgdir/opt/ut" --extract "de.int" DE.umod || return 1
    umodunpack --base "$pkgdir/opt/ut" --extract "de.u" DE.umod || return 1
    umodunpack --base "$pkgdir/opt/ut" --extract "demutators-readme.txt" DE.umod || return 1
    umodunpack --base "$pkgdir/opt/ut" --extract "de-logo.bmp" DE.umod || return 1
    chmod -R -- 644 $pkgdir/opt/ut/*/*
}

package_unrealtournament-bonuspack3() {
    pkgname="unrealtournament-bonuspack3"
    pkgdesc="Bonuspack 3: The Inoxx Pack for Unreal Tournament."
    conflicts=(ut1999-bonuspack3)

    cd "${srcdir}/Unreal Tournament Bonus Pack 3"

    install --directory -m775 -- ${pkgdir}/opt/ut/Textures
    umodunpack --base ${pkgdir}/opt/ut --unpack UTInoxxPack.umod || return 1
    mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    rm -rf -- ${pkgdir}/opt/ut/textures
}

package_unrealtournament-bonuspack4() {
    pkgname=unrealtournament-bonuspack4
    pkgdesc="Bonuspack 4: The Christmas 2000 Pack for Unreal Tournament."
    conflicts=(ut1999-bonuspack4)
    install=unrealtournament-bonuspack4.install

    cd "${srcdir}/Unreal Tournament Bonus Pack 4"

    install --directory -- ${pkgdir}/opt/ut/{System,Textures}
    umodunpack --base ${pkgdir}/opt/ut --unpack UMOD/UTBonusPack4.umod || return 1
    mv -f -t ${pkgdir}/opt/ut/System -- ${pkgdir}/opt/ut/system/*
    mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    rm -rf -- ${pkgdir}/opt/ut/{system,textures}
    # OldUnreal patch already includes this file
    rm -rf ${pkgdir}/opt/ut/System/SkeletalChars.u
}

