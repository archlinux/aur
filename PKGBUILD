# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=pillarsofeternity-thewhitemarch1-gog
pkgver=2.9.0.11
pkgrel=1
pkgdesc="Part 1 of The White March expansion to Pillars of Eternity"
arch=("any")
url="https://www.gog.com/game/pillars_of_eternity_the_white_march_expansion_pass"
license=("custom:commercial")
options=("!emptydirs")
depends=("pillarsofeternity-gog")
source=("gog_pillars_of_eternity_white_march_part_1_dlc_${pkgver}.sh::file://gog_pillars_of_eternity_white_march_part_1_dlc_${pkgver}.sh")
sha256sums=("42c09a9bbf949d8a17fe1ab34d54a76df3793fd7076fd1ee2e8eb31c516dec9b")

# Disable compression of the package
PKGEXT=".pkg.tar"

prepare() {
    ln -s "data/noarch/" "$srcdir/pe"
}

package() {
    # Data
    install -m755 -d "$pkgdir/opt/pillarsofeternity-gog/game"
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/pillarsofeternity-gog/game/" "$srcdir/pe/game/PillarsOfEternity_Data"
    find "$pkgdir/opt/pillarsofeternity-gog/game/PillarsOfEternity_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/pillarsofeternity-gog/game/PillarsOfEternity_Data" -type f -print0 | xargs -0 chmod 644

    #
    # System integration
    #

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/pillarsofeternity-gog/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
