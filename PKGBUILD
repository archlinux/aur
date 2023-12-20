pkgname=vapoursynth-preview-iew-git
pkgver=0.8.1.14.g0418418
pkgrel=1
pkgdesc="Standalone previewer for VapourSynth scripts (GIT version)"
arch=('any')
url='https://github.com/Irrational-Encoding-Wizardry/vs-preview'
license=('MIT')
depends=(
    'vapoursynth'
    'python-pyqt6'
    'python-pyqt6-sip'
    'python-pyaml'
    'python-qdarkstyle'
    'vapoursynth-plugin-vsengine-git'
    'vapoursynth-plugin-vsakarin-git'
    'python-matplotlib'
    'vapoursynth-plugin-vstools-git'
)
makedepends=('git'
    'python-pip'
    'python-wheel'
)
provides=("vapoursynth-preview")
conflicts=("vapoursynth-preview" "vapoursynth-preview-git")
source=("vapoursynth-preview::git+https://github.com/Irrational-Encoding-Wizardry/vs-preview.git")
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
