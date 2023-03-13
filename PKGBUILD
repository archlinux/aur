# Maintainer: Eugene Dvoretsky <radioxoma at gmail com>

_name=langmix
pkgname=$_name-git
pkgver=0.2.1.r0.gbe671f7
pkgrel=1
pkgdesc="Extract and merge multilingual subtitles into one file"
arch=('any')
url="https://github.com/radioxoma/langmix"
license=('MIT')
depends=('python-pysrt')
makedepends=('git' 'python-build' 'python-installer')
optdepends=('ffmpeg: extract SRT subtitles')
provides=("$_name")
source=("$pkgname::git+https://github.com/radioxoma/langmix")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 "extractors/langmix-extractsrt.sh" "$pkgdir/usr/bin/langmix-extractsrt"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_name"
}
