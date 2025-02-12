pkgname=vapoursynth-preview-git
pkgver=0.11.0.1.g8f9f666
pkgrel=1
pkgdesc="Previewer for VapourSynth scripts (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('MIT')
depends=(
    'vapoursynth'
    'python-pyqt6'
    'python-pyqt6-sip'
    'python-pyaml'
    'python-qdarkstyle'
    'vapoursynth-plugin-vsengine'
    'vapoursynth-plugin-vsakarin'
    'python-matplotlib'
    'vapoursynth-plugin-vstools'
    'python-requests-toolbelt'
)
makedepends=('git'
    'python-pip'
    'python-wheel'
)
provides=("vapoursynth-preview")
conflicts=("vapoursynth-preview")
source=("vapoursynth-preview::git+https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview.git")
sha256sums=('SKIP')

pkgver() {
    cd "vapoursynth-preview"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
    cd "vapoursynth-preview"
    pip wheel --no-deps . -w dist
}

package() {
    cd "vapoursynth-preview"
    pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl
}
