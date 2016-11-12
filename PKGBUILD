# Maintainer: Guillaume Hayot <postblue@postblue.info>

pkgname=pillarsofeternity-dlc-gog
pkgver=2.0.0.2
pkgrel=1
pkgdesc="Pillars of Eternity Hero Edition preorder bonus: Pledge of Gaun Ring (item) and Space Piglet (pet)"
arch=("any")
url="https://www.gog.com/game/pillars_of_eternity_hero_edition"
license=("custom:commercial")
options=("!emptydirs")
depends=("pillarsofeternity-gog")
source=("gog_pillars_of_eternity_preorder_item_and_pet_dlc_${pkgver}.sh::file://gog_pillars_of_eternity_preorder_item_and_pet_dlc_${pkgver}.sh")
sha256sums=('ebb7e45e20440606f408df10ddc342411d18c4976aaddd6e2ac279abd3ae5c8a')

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
