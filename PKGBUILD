_pkgname="hnsky"
pkgname="hnsky-hg"
pkgver=4.2.15
pkgrel=2
pkgdesc="Semi professional free planetarium program"
arch=("x86_64")
url='https://sourceforge.net/projects/hnsky/'
license=('GPL3')
makedepends=('lazarus' 'mercurial')
depends=('qt5-base' 'qt5-x11extras' 'qt5pas')
source=("hg+http://hg.code.sf.net/p/${_pkgname}/code")
sha256sums=('SKIP')
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
	    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
	    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
            'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV')


build() {
   cd $srcdir/code/synapse
   lazbuild laz_synapse.lpk 
   
   cd $srcdir/code
   lazbuild hnsky_w64.lpi
   lazbuild hnsky_w64_themes.lpi
}

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/code/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
}
