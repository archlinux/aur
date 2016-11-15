# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.


# Maintainer: Mouton5000 <patate nodot mouton arobase|at gmail dot com>

pkgname=dosbox-dune
pkgver=1.0
pkgrel=1
pkgdesc="Dune - old DOS game, Floppy version,  English, French and German langages"
arch=("any")
url="http://www.abandonware-france.org/ltf_abandon/ltf_jeu.php?id=78"
license=('Abandonware')
depends=('dosbox' 'unzip')
source=(
    'jeu-00078-dune-pcdos.7z::http://www.abandonware-france.org/telechargement/clic/http/1252/files/'
    'dune-logo.png'
    'run_dune.sh'
)
md5sums=('24d83678e82a7b21e030bdd1d351f027'
         '96f1deb7d3523ecbf9d3b05f9afb0e93'
         '4057a22528e982118748ee78588ed025')
_commandname='dune-game'
_dunelogo='dune-logo.png'
_shname='run_dune.sh'

package () {

    # Create folders
    install -d -m755 ${pkgdir}/opt/${pkgname}/
    install -d -m755 ${pkgdir}/usr/bin/
    install -d -m755 ${pkgdir}/usr/share/applications/

    # English version
    cp ${srcdir}/Dune/DUNE.BAT ${srcdir}/Dune/DUNE_EN.BAT 
    sed -i 's/FRA/ENG/g' ${srcdir}/Dune/DUNE_EN.BAT 
    
    # French version
    cp ${srcdir}/Dune/DUNE.BAT ${srcdir}/Dune/DUNE_FR.BAT 
    
    # German version
    cp ${srcdir}/Dune/DUNE.BAT ${srcdir}/Dune/DUNE_DT.BAT 
    sed -i 's/FRA/GER/g' ${srcdir}/Dune/DUNE_DT.BAT 

    # Remove default BAT
    rm ${srcdir}/Dune/DUNE.BAT

    #Copy sources
    install -D -m644 ${srcdir}/Dune/* ${pkgdir}/opt/${pkgname}/
    install -D -m644 ${srcdir}/Lisez-Moi.txt ${pkgdir}/opt/${pkgname}/
    install -D -m644 ${srcdir}/${_dunelogo} ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_dunelogo}
    install -D -m755 ${srcdir}/${_shname} ${pkgdir}/opt/${pkgname}/

    # create command
    ln -s /opt/${pkgname}/${_shname} ${pkgdir}/usr/bin/${_commandname}
    
    # Create .desktop file
    printf "[Desktop Entry]

# The type as listed above
Type=Application

# The version of the desktop entry specification to which this file complies
Version=1.0

# The name of the application
Name=${_commandname}

# A comment which can/will be used as a tooltip
Comment=${pkgdesc}

# The executable of the application.
Exec=${_commandname}

# The name of the icon that will be used to display this entry
Icon=/usr/share/icons/hicolor/256x256/apps/${_dunelogo}

# Describes whether this application needs to be run in a terminal or not
Terminal=false

# Describes the categories in which this entry should be shown
Categories=Game;Abandonware;" >> ${pkgdir}/usr/share/applications/${pkgname}.desktop

}




