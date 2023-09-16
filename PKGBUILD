# Maintainer: WhiredPlanck
pkgname=astap-bin
_pkgname=astap
pkgver=2023.09.11
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer. Gtk2 version."
arch=('i686' 'x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
source_i686=("${_pkgname}_i386.deb::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_i386.deb/download")
source_x86_64=("${_pkgname}_amd64.deb::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_amd64.deb/download")
sha256sums_i686=('7eac349054b72b7ba31ba45f0fa2013900dbeccea1e3440fc9e2cd9f2809181d')
sha256sums_x86_64=('b2d09f1425354e6cf3138a69117fbec65fb1fbc5d3425930ad72e5b129569afa')
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
	    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
	    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
            'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV')
conflicts=('astap' 'astap-bin-qt5' 'astap-cli')

mkinfo() { echo -e "[\e[96mMKINFO\e[0m]:  \e[1m$*\e[0m"; }


prepare() {
    if [[ "$CARCH" == "i686" ]]; then
      ar x "${srcdir}/${_pkgname}_i386.deb"
    else
      ar x "${srcdir}/${_pkgname}_amd64.deb"
    fi

    mkinfo "Extracting data.tar.xz ..."
    tar -xpvf "${srcdir}"/data.tar.xz
}

package() {
    cp -r "${srcdir}"/opt "${pkgdir}"/opt
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
