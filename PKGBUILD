# Maintainer: sitiyou <sitiyou7@gmail.com>

pkgname=python-kara-templater
pkgver=1.2.2
pkgrel=1
pkgdesc='Python karaoke effects engine for standard ASS subtitles and libplacebo shaders'
arch=('x86_64')
url='https://github.com/sitiyou/python-kara-templater'
license=('MIT')
depends=(
  'python>=3.12'
  'python-aggdraw'
  'python-pillow'
  'glibc'
  'libgcc'
  'libstdc++'
  'freetype2'
  'harfbuzz'
  'fribidi'
  'fontconfig'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=77'
  'cargo'
)
checkdepends=('python-pytest' 'ttf-dejavu' 'noto-fonts-cjk')
source=("https://files.pythonhosted.org/packages/source/k/kara-templater/kara_templater-$pkgver.tar.gz"
        "check-core.sh")
sha256sums=('a658a2fe38056eb255a27b933d93b116280557730dfb82a221250aa11a578992'
            '2c298a5d69011fab59a7233e695427b907f2d4cc1414038ad7ceb050e8b2693c')

build() {
  cd "kara_templater-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$(mktemp -d "$srcdir/check.XXXXXXXX")"
  bash "$srcdir/check-core.sh" "$srcdir/kara_templater-$pkgver"
}

package() {
  cd "kara_templater-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
