# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=0.21.0
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'desktop-file-utils' 'python-six' 'python-numpy' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-pillow' 'python-opengl' 'python-pyparsing' 'python-scipy' 'python-sphinx_rtd_theme' 'python-opengl-accelerate' 'python-wxpython-phoenix' 'fsl' 'fsleyes-widgets>=0.4.1' 'fsleyes-props>=1.4.0' 'python-wxnatpy>=0.3.0' 'python-indexed-gzip>=0.7.0')
makedepends=()
provides=()
conflicts=()
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/repository/archive.tar.gz?ref=$pkgver"
        "$pkgname.png::https://git.fmrib.ox.ac.uk/uploads/-/system/group/avatar/85/icon_512x512.png"
        "$pkgname.desktop")
sha256sums=('3ab42d74b297b008aa1559ebb9fb636e0e043b82e022f8f6dd0a357c5ab263ab'
            'c7211ee624483a272f280b3aa772046ec9226d838f9c3023450888abddf9d71a'
            '6e91e88eb74602f8da7cda6575245dbaaf4577022bffe15c0efedb33106139fb')

package() {
  cd "$srcdir/$pkgname-$pkgver-"*
  # "Patching" for scipy 1.0 support
  sed -i 's/scipy==0\.\*/scipy/g' requirements.txt

  python setup.py install --root="$pkgdir/" --optimize=1
  
  cd "$startdir"
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
