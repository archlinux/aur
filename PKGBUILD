# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>

pkgname=manuskript
pkgver=0.11.0
pkgrel=2
arch=('any')

pkgdesc="An open-source tool for writers."
url="http://www.theologeek.ch/manuskript"
license=('GPL3')

provides=('manuskript')
conflicts=('manuskript-git')

makedepends=('unzip')
depends=('python' 'python-pyqt5' 'qt5-svg' 'python-lxml')
optdepends=(
    'python-pyenchant: spell check support'
    'python-pyspellchecker: spell check support'
    'python-symspellpy: spell check support'
    'python-markdown: export as html'
    'pandoc: more export formats'
)

source=("https://github.com/olivierkes/"${pkgname}"/archive/"${pkgver}".zip"
         "manuskript.desktop")
md5sums=('2a9542cafb1639eb4e487be1b1366bec'
         '0c298d39bb0847f17559e71bc29af5ce')

# Install in file system (not in /opt!)
package () {
    mkdir -p "${pkgdir}"/usr/share/"${pkgname}"/{bin,i18n,icons,libs,manuskript,resources,sample-projects}
    mkdir -p "${pkgdir}"/usr/share/applications/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/bin/manuskript "${pkgdir}"/usr/share/"${pkgname}"/bin/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/i18n/* "${pkgdir}"/usr/share/"${pkgname}"/i18n/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/icons/* "${pkgdir}"/usr/share/"${pkgname}"/icons/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/libs/* "${pkgdir}"/usr/share/"${pkgname}"/libs/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/manuskript/* "${pkgdir}"/usr/share/"${pkgname}"/manuskript/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/resources/* "${pkgdir}"/usr/share/"${pkgname}"/resources/
    cp -a "${srcdir}"/"${pkgname}"-"${pkgver}"/sample-projects/* "${pkgdir}"/usr/share/"${pkgname}"/sample-projects/

    # Make unneeded scripts non-executable
    chmod 644 "${pkgdir}"/usr/share/"${pkgname}"/i18n/*.sh
    chmod 644 "${pkgdir}"/usr/share/"${pkgname}"/icons/cleanIcons.py

    # Install required files for desktop use
    mkdir -p "${pkgdir}"/usr/bin/
    install -m 755 "${srcdir}"/"${pkgname}"-"${pkgver}"/package/create_deb/manuskript "${pkgdir}"/usr/bin/
    install -m 644 manuskript.desktop "${pkgdir}"/usr/share/applications/
}
