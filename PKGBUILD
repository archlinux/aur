# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Grigorii Horos <horosgrisa@gmail.com>

_pkgname=papirus-suite
pkgbase=papirus-git
pkgname=(
         'bomi-skin-papirus-git'
         'libreoffice-papirus-theme-git'
         'papirus-git'
         'papirus-aurorae-theme-git'
         'papirus-color-scheme-git'
         'papirus-gtk-theme-git'
         'papirus-icon-theme-gtk-git'
         'papirus-icon-theme-kde-git'
         'papirus-k3b-theme-git'
         'papirus-kmail-theme-git'
         'papirus-konsole-colorscheme-git'
         'papirus-plasma-theme-git'
         'papirus-qtcurve-theme-git'
         'papirus-sddm-theme-git'
         'papirus-smplayer-theme-git'
         'papirus-vlc-theme-git'
         'papirus-yakuake-theme-git' 
         )
pkgver=r624.eda134b
pkgrel=1
pkgdesc="Papirus Suite for KDE (git version)"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=()
makedepends=('git' 'gtk-update-icon-cache' 'xdg-utils')
depends=()
conflicts=('papirus')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_bomi-skin-papirus-git() {
    pkgdesc="Papirus theme for Bomi"
    options=()
    makedepends=('git')
    depends=('bomi-fresh')
    optdepends=()
    conflicts=('bomi-skin-papirus')
    install -dm755 ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_pkgname}/players-skins/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_libreoffice-papirus-theme-git() {
    pkgdesc="Papirus theme for Libreoffice"
    options=()
    makedepends=('git')
    depends=()
    optdepends=('libreoffice' 'libreoffice-fresh-rpm')
    conflicts=('libreoffice-style-papirus' 'libreoffice-papirus-theme' 'libreoffice-fresh-rpm-papirus-theme')
    install -Dm644 -t "${pkgdir}/usr/lib/libreoffice/share/config/" ${srcdir}/${_pkgname}/libreoffice-icons/*.zip
    install -Dm644 -t "${pkgdir}/opt/libreoffice5.1/share/config/"  ${srcdir}/${_pkgname}/libreoffice-icons/*.zip
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-git() {
    pkgdesc="Meta-package for modified and adaptive Papirus theme (git version)"
    depends=(
             'papirus-aurorae-theme-git'
             'papirus-color-scheme-git'
             'papirus-gtk-theme-git'
             'papirus-icon-theme-kde-git'
             'papirus-konsole-colorscheme-git'
             'papirus-plasma-theme-git' 
             'papirus-qtcurve-theme-git'
             'papirus-sddm-theme-git'
             'papirus-yakuake-theme-git'
             )
    optdepends=(
                "bomi-skin-papirus-git: Papirus theme for Bomi (git version)"
                "libreoffice-papirus-theme-git: Papirus theme for LibreOffice (git version)" 
                "papirus-k3b-theme-git: Papirus theme for K3B (git version)"
                "papirus-kmail-theme-git: Papirus theme for KMail (git version)"
                "papirus-smplayer-theme-git: Papirus theme for SMPlayer (git version)"
                "papirus-vlc-theme-git: Papirus theme for VLC Media Player (git version)" 
                "papirus-yakuake-theme-git: Papirus theme for Yakuake (git version)"
                "papirus-wallpapers-git: Papirus wallpapers suite (git version)"
                )
} 

package_papirus-aurorae-theme-git() {
    pkgdesc="Papirus decorations for Kwin (git version)"
    options=()
    makedepends=('git')
    depends=('kwin')
    optdepends=()
    conflicts=('papirus-aurorae-theme')
    install -dm755 ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_pkgname}/kde-pack/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-color-scheme-git() {
    pkgdesc="Papirus color scheme for KDE (git version)"
    options=()
    makedepends=('git')
    depends=('plasma-desktop')
    optdepends=()
    conflicts=('papirus-color-scheme')
    install -Dm644 -t "${pkgdir}/usr/share/color-schemes/"   ${srcdir}/${_pkgname}/kde-pack/color-schemes/*.colors
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-gtk-theme-git() {
    pkgdesc="Papirus GTK theme for KDE (git version)"
    options=()
    makedepends=('git')
    depends=('gtk-engine-murrine' 'gtk2' 'gtk3')
    optdepends=()
    conflicts=('papirus-gtk-theme')
    install -dm755 ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_pkgname}/kde-pack/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-icon-theme-gtk-git() {
    pkgdesc="Papirus icon theme for GTK (git version)"
    options=('!strip')
    makedepends=('git' 'gtk-update-icon-cache' 'xdg-utils')
    install='icon-cache-refresh.install'
    depends=()
    optdepends=()
    conflicts=('papirus-gtk-icon-theme' 'papirus-gtk-icon-theme-git' 'papirus-icon-theme-gtk')
    install -dm755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_pkgname}/gtk-icons/Papirus* ${pkgdir}/usr/share/icons/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-icon-theme-kde-git() {
    pkgdesc="Papirus icon theme for KDE (git version)"
    options=('!strip')
    makedepends=('git' 'gtk-update-icon-cache' 'xdg-utils')
    install='icon-cache-refresh.install'
    depends=()
    optdepends=()
    conflicts=('papirus-icon-theme' 'papirus-icon-theme-kde' 'papirus-icon-theme-git')
    install -dm755 ${pkgdir}/usr/share/{icons,apps/amarok/icons/papirus{,-black-panel,-dark}}
    cp -r ${srcdir}/${_pkgname}/kde-pack/icons/papirus*                                  ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_pkgname}/kde-pack/icons/papirus/extra-icons/amarok/*              ${pkgdir}/usr/share/apps/amarok/icons/papirus/
    cp -r ${srcdir}/${_pkgname}/kde-pack/icons/papirus-black-panel/extra-icons/amarok/*  ${pkgdir}/usr/share/apps/amarok/icons/papirus-black-panel/
    cp -r ${srcdir}/${_pkgname}/kde-pack/icons/papirus-dark/extra-icons/amarok/*         ${pkgdir}/usr/share/apps/amarok/icons/papirus-dark/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-k3b-theme-git() {
    pkgdesc="Papirus theme for K3B (git version)"
    options=()
    makedepends=('git')
    depends=('k3b')
    optdepends=()
    install -dm755 ${pkgdir}/usr/share/{k3b/pics,apps/k3b/pics}
    cp -r ${srcdir}/${_pkgname}/kde-pack/k3b-themes/* ${pkgdir}/usr/share/k3b/pics/
    cp -r ${srcdir}/${_pkgname}/kde-pack/k3b-themes/* ${pkgdir}/usr/share/apps/k3b/pics/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-kmail-theme-git() {
    pkgdesc="Papirus theme for Kmail (git version)"
    options=()
    makedepends=('git')
    depends=('kmail')
    optdepends=()
    conflicts=('papirus-kmail-theme')
    install -dm755 ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_pkgname}/kde-pack/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-konsole-colorscheme-git() {
    pkgdesc="Papirus colorscheme for Konsole (git version)"
    options=()
    makedepends=('git')
    depends=('konsole')
    optdepends=()
    conflicts=('papirus-konsole-colorscheme')
    install -Dm644 -t "${pkgdir}/usr/share/konsole/" ${srcdir}/${_pkgname}/kde-pack/konsole-colorschemes/*.colorscheme
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-plasma-theme-git() {
    pkgdesc="Papirus plasma theme for KDE (git version)"
    options=()
    makedepends=('git')
    depends=('plasma-desktop')
    optdepends=()
    conflicts=('papirus-look-and-feel' 'plasma-theme-papirus')
    install='plasma-refresh.install'
    install -dm755 ${pkgdir}/usr/share/plasma/{desktoptheme,look-and-feel}
    cp -r ${srcdir}/${_pkgname}/kde-pack/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    cp -r ${srcdir}/${_pkgname}/kde-pack/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-qtcurve-theme-git() {
    pkgdesc="Papirus decorations for QtCurve (git version)"
    options=()
    makedepends=('git')
    depends=('qtcurve-gtk2' 'qtcurve-qt4' 'qtcurve-qt5' 'qtcurve-utils' 'lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4' 'lib32-qtcurve-utils')
    optdepends=()
    conflicts=('papirus-qtcurve-theme')
    install -Dm644 -t "${pkgdir}/usr/share/QtCurve/" ${srcdir}/${_pkgname}/kde-pack/QtCurve/*.qtcurve
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-sddm-theme-git() {
    pkgdesc="Papirus theme for SDDM (git version)"
    options=()
    makedepends=('git')
    depends=('sddm' 'sddm-kcm')
    optdepends=()
    conflicts=('papirus-sddm-theme')
    install -Dm644 -t "${pkgdir}/usr/share/sddm/themes/papirus/"      ${srcdir}/${_pkgname}/kde-pack/sddm-themes/papirus/*
    install -Dm644 -t "${pkgdir}/usr/share/sddm/themes/papirus-dark/" ${srcdir}/${_pkgname}/kde-pack/sddm-themes/papirus-dark/*
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-smplayer-theme-git() {
    pkgdesc="Papirus theme for SMPlayer (git version)"
    options=()
    makedepends=('git')
    depends=('smplayer')
    optdepends=()
    conflicts=('papirus-smplayer-theme')
    install -Dm644 -t "${pkgdir}/usr/share/smplayer/themes/Papirus/"        ${srcdir}/${_pkgname}/players-skins/smplayer-themes/Papirus/*
    install -Dm644 -t "${pkgdir}/usr/share/smplayer/themes/PapirusDark/"    ${srcdir}/${_pkgname}/players-skins/smplayer-themes/PapirusDark/*
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-vlc-theme-git() {
    pkgdesc="Papirus theme for VLC Media Player (git version)"
    options=()
    makedepends=('git')
    depends=('vlc')
    optdepends=()
    conflicts=('papirus-vlc-theme')
    install -Dm644 -t "${pkgdir}/usr/share/vlc/skins2/" ${srcdir}/${_pkgname}/players-skins/vlc-skins/*.vlt
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}

package_papirus-yakuake-theme-git() {
    pkgdesc="Papirus theme for Yakuake (git version)"
    options=()
    makedepends=('git')
    depends=('yakuake')
    optdepends=()
    conflicts=('papirus-yakuake-theme' 'yakuake-skin-papirus' 'yakuake-skin-papirus-dark' 'yakuake-skin-papirus-dark-frameworks' 'yakuake-skin-papirus-frameworks')
    install -dm755 ${pkgdir}/usr/share/{apps/yakuake/skins,yakuake/skins}
    cp -r ${srcdir}/${_pkgname}/kde-pack/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    find "${pkgdir}" -type f -exec chmod 644 {} +
    find "${pkgdir}" -type d -exec chmod 755 {} +
}
