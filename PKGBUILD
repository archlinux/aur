# Maintainer: Popolon <popolon @L popolon dot org>
# made with pip2pkgbuild, tuned by hand

_module='pypiano'
pkgname="python-${_module}"
pkgver='0.1.2'
_src_folder="${_module}-${pkgver}"
pkgrel=1
pkgdesc="Library to programmatically play piano"
url="https://github.com/FelixGSE/pypiano"
depends=('python' 'python-mingus' 'fluidsynth' 'soundfont-fluid')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://github.com/FelixGSE/${_module}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0edf01a66c94a3fda5ddccea812eed8d1725a2be75c1db5343d4d28debb92d87')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    python_majmin=`python --version | awk '{print $2}'| cut -d . -f 1,2`
    rm ${pkgdir}/usr/lib/python${python_majmin}/site-packages/pypiano/sound_fonts/FluidR3_GM.sf2
    ln -s /usr/share/soundfonts/FluidR3_GM.sf2 ${pkgdir}/usr/lib/python${python_majmin}/site-packages/pypiano/sound_fonts/
}
