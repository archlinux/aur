# Maintainer: Lewis Donaldson <lewdon0001@gmail.com>
pkgname=lyrwal
pkgver=1.0.10
pkgrel=1
pkgdesc="A program to set the wallpaper to random song lyrics"
arch=('any')
url="https://github.com/ZerimGH/lyrwal"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('make' 'gcc' 'python')
source=("git+https://github.com/ZerimGH/lyrwal.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/lyrwal"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/lyrwal"

  make all -C textwal

  python -m venv venv

  venv/bin/pip install --upgrade pip
  venv/bin/pip install -r py/requirements.txt
}

package() {
  cd "$srcdir/lyrwal"

  install -Dm755 lyrwal.sh \
    "$pkgdir/usr/bin/lyrwal"

  install -Dm755 textwal/build/textwal \
    "$pkgdir/usr/bin/textwal"

  install -d "$pkgdir/usr/lib/lyrwal"
  cp -r py "$pkgdir/usr/lib/lyrwal/"

  cp -r venv "$pkgdir/usr/lib/lyrwal/venv"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

