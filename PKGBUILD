# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=0.27.3
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'python-setuptools' 'python-sphinx' 'python-six' 'python-numpy' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-pillow' 'python-opengl' 'python-pyparsing' 'python-scipy' 'python-opengl-accelerate' 'python-wxpython>=4.0.1-2' 'fsl' 'fslpy>=1.13.3' 'fsleyes-widgets>=0.7.2' 'fsleyes-props>=1.6.4-2' 'python-wxnatpy>=0.3.1-2' 'python-indexed-gzip>=0.8.7')
makedepends=()
provides=()
conflicts=()
replaces=()
source=("${pkgname}-${pkgver}.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/repository/archive.tar.gz?ref=${pkgver}"
        "${pkgname}.png::https://git.fmrib.ox.ac.uk/uploads/-/system/group/avatar/85/icon_512x512.png"
        "${pkgname}.desktop")
sha256sums=('9dce9d2e0c30a043b2e722c5f903a4e773b198a3eb29e63ef138bf1304ac6a75'
            'c7211ee624483a272f280b3aa772046ec9226d838f9c3023450888abddf9d71a'
            '6e91e88eb74602f8da7cda6575245dbaaf4577022bffe15c0efedb33106139fb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-"*
  # "Patching" for Pillow>=5.0 support
  sed -i 's/Pillow>=3\.2\.0,<5\.0/Pillow>=3\.2\.0/g' requirements.txt
  # "Patching" for matplotlib>3.0.0 support
  sed -i 's/matplotlib>=1\.5\.1,<3\.0/matplotlib>=1.5.1/g' requirements.txt

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-"*
  
  python setup.py install --root="${pkgdir}/" --optimize=1
  
  install -Dm644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
