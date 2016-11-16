# Maintainer: Mouton5000 <patate nodot mouton arobase|at gmail dot com>

pkgname=dosbox-kyrandia-book1-fr
pkgver=1.0
pkgrel=1
pkgdesc="Legend of Kyrandia, Book 1 - old DOS game, Floppy version, French langage"
arch=("any")
url="http://www.abandonware-france.org/ltf_abandon/ltf_jeu.php?id=121"
license=('Abandonware')
depends=('dosbox' 'unzip')
source=(
    'jeu-00121-legend_of_kyrandia-pcdos.7z::http://www.abandonware-france.org/telechargement/clic/http/2263/files/'
    'kyrandia-book1-logo.png'
    'run-kyrandia-book1-fr.sh'
)
md5sums=('ede23fe0ff1c8d250d5dc47555d3d978'
         '6835d644837879fdfa7d31368e5a67ec'
         '9ea4cd14deb1b043f8705d5aaf62a75a')
_commandname='kyrandia-book1-fr-game'
_logo='kyrandia-book1-logo.png'
_shname='run-kyrandia-book1-fr.sh'

package () {

    # Create folders
    install -d -m755 ${pkgdir}/opt/${pkgname}/
    install -d -m755 ${pkgdir}/usr/bin/
    install -d -m755 ${pkgdir}/usr/share/applications/

    #Copy sources
    install -D -m644 ${srcdir}/Kyrandia/* ${pkgdir}/opt/${pkgname}/
    install -D -m644 ${srcdir}/Lisez-Moi.txt ${pkgdir}/opt/${pkgname}/
    install -D -m644 ${srcdir}/${_logo} ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_logo}
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
Icon=/usr/share/icons/hicolor/256x256/apps/${_logo}

# Describes whether this application needs to be run in a terminal or not
Terminal=false

# Describes the categories in which this entry should be shown
Categories=Game;Abandonware;" >> ${pkgdir}/usr/share/applications/${pkgname}.desktop

}
