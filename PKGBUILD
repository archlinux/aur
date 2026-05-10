# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=26.04.2
pkgrel=1
pkgdesc='The default Wallpapers for Ubuntu'
arch=('any')
url='https://launchpad.net/ubuntu-wallpapers'
_pool_url='http://archive.ubuntu.com/ubuntu/pool/main'
license=('custom')
makedepends=('python-distutils-extra' 'python-setuptools')

# https://packages.ubuntu.com/source/ubuntu-wallpapers
# http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers/
source=(
  "${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
)
sha512sums=('841bb6d5f2bf86abd16e604000fd82b65c6ceee4f2e7c424df4d989ea204a15d997c3d4e905420408958193bf4f4aec9d8a6558832d9cc800141e51f05cc2bf5')

prepare() {
  sed -e 's|version = version,|version = "'"${pkgver}"'",|' -i "${pkgname}-${pkgver}/setup.py"
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
