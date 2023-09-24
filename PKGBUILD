# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=astap-bin-qt5
pkgver=2023.09.22
pkgrel=1
pkgdesc="Astrometric (plate) solver, stacking of images, photometry and FITS viewer"
provides=('astap')
conflicts=('astap-bin' )
arch=('x86_64') # no 32-bit version provided, consider building from source with the `astap` package
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("astap-${pkgver}.tar.gz::https://github.com/wrenby/astap-backups/raw/a25a5871951c9c0e923802f8bc2400fa19807480/astap_amd64_qt5.tar.gz")
md5sums=('2b7e2cf48063a19b7abf3a6c9577d297')

noextract=("astap-${pkgver}.tar.gz") # bsdtar can't handle this archive because it contains a self-referential hardlink
makedepends=('tar') # but gnu tar is just fine
depends=('qt5pas' 'libjpeg-turbo' 'libx11' 'gcc-libs' 'zlib' 'glibc')

# these databases aren't hard-limited by the bounds provided here
# databases can identify 100% of the sky in the ranges provided,
# but can also identify some regions of the sky with FOVs smaller or larger than the given bounds
# there is no downside to choosing the bigger d__ databases, other than the larger file size
optdepends=('hyperleda-galaxy-db-astap: 25MB database of 1.3m galaxies and 171k other non-star objects'
    'w08-star-db-astap: 250KB database of stars up to magnitude 8, reliable above 20° FOV'
    'g05-star-db-astap: same as d05 but with larger 10 degree tiles, reliable with 1-20° FOV'
    'd05-star-db-astap: 100MB database of 500 stars per square degree, reliable with 0.6-10° FOV'
    'd20-star-db-astap: 400MB database of 2000 stars per square degree, reliable with 0.3-10° FOV'
    'd50-star-db-astap: 900MB database of 5000 stars per square degree, reliable with 0.2-10° FOV'
    'v50-star-db-astap: 1GB, same as d50 but includes photometry info, reliable with 0.2-10° FOV'
    'd80-star-db-astap: 1.2GB database of 8000 stars per square degree, reliable with 0.15-10° FOV')

prepare() {
    tar xpf "astap-${pkgver}.tar.gz"
}

package() {
    cp -r "${srcdir}"/opt "${pkgdir}"/opt
    cp -r "${srcdir}"/usr/local "${pkgdir}"/usr
}
