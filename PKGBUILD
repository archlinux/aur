# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=astap-bin-qt5
pkgver=2022.5.7
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer"
provides=('astap')
conflicts=('astap-bin')
arch=('x86_64') # no 32-bit version provided
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("astap.tar.gz::https://sourceforge.net/projects/astap-program/files/linux_installer/astap_amd64_qt5.tar.gz/download")
sha256sums=('24d20b825bc78e03c053b05af13bfbc885535b3ecc83e2f7f51f8c782b5a465f')

noextract=("astap.tar.gz") # bsdtar can't handle this archive because it contains a self-referential hardlink
makedepends=('tar') # but gnu tar is just fine

# these databases aren't hard-limited by the bounds provided here
# databases can identify 100% of the sky in the ranges provided,
# but can also identify some regions of the sky with FOVs smaller or larger than the given bounds
optdepends=('hyperleda-galaxy-db-astap: database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: database of stars up to magnitude 8, reliable above 20° FOV'
	    'v17-photometry-color-db-astap: color database of stars up to magnitude 17, reliable with 1-20° FOV, slower but required for photometry'
	    'h17-star-db-astap: database of stars up to magnitude 17, reliable with 1-10° FOV'
            'h18-star-db-astap: database of stars up to magnitude 18, reliable with 0.25-10° FOV')

prepare() {
    tar xpf astap.tar.gz
}

package() {
    cp -r "${srcdir}"/opt "${pkgdir}"/opt
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}

