# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=astap-bin-qt5
pkgver=2023.06.08
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer"
provides=('astap')
conflicts=('astap-bin' )
arch=('x86_64') # no 32-bit version provided, consider building from source with the `astap` package
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("astap-${pkgver}.tar.gz::https://github.com/wrenby/astap-backups/raw/285daf3c41d9cc69732d201c11d59164b77076bf/astap_amd64_qt5.tar.gz")
md5sums=('1e953c28a53b8182190cfa51a85dc295')

noextract=("astap-${pkgver}.tar.gz") # bsdtar can't handle this archive because it contains a self-referential hardlink
depends=('qt5-base' 'qt5-x11extras' 'qt5pas') # qt5 + pascal bindings
makedepends=('tar') # but gnu tar is just fine

# these databases aren't hard-limited by the bounds provided here
# databases can identify 100% of the sky in the ranges provided,
# but can also identify some regions of the sky with FOVs smaller or larger than the given bounds
# there is no downside to choosing d50 compared to d05, other than the larger file size
# the new g05 database covering the 10-20° gap does not yet have an associated package on the AUR
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
            'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
	    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
	    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
            'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV')

prepare() {
    tar xpf "astap-${pkgver}.tar.gz"
}

package() {
    cp -r "${srcdir}"/opt "${pkgdir}"/opt
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
