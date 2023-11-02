# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: SoftwareRat <chenxiaolong@cxl.epac.to>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname='ubuntu-wallpapers'
pkgver=23.10.4
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
  "${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.debian.tar.xz"
)
sha512sums=('5d99db3ca1bed9ff55d9c4db4e66542f1279df6cb6f7ec8a242e362eaacded10c31a3d3a6c6c1adae6413ad5d5364f1a1e61fe1d968532ffdcd2ff7dfe7ea44e'
            '709619d268b9622cb3df56e0a7eca021ab822a9020ea0a7ce59755f9ee27818e6d0fd0dc2b88820f451f28c50475926e07bbee7af10efcdb7b29f750fc36d3f8')

prepare() {
  cd "${pkgname}-${pkgver}"
  # The setup.py script reads the package version from debian/*
  ln -sfv ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dvm644 'debian/copyright' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
