# Maintainer: Lewis Donaldson <lewdon0001@gmail.com>
pkgname=lyrwal2
pkgver=1.0.1
pkgrel=1
pkgdesc="A program to set the wallpaper to random song lyrics"
arch=('any')
url="https://github.com/ZerimGH/lyrwal2"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('make' 'gcc' 'python' 'freetype2')
source=("git+https://github.com/ZerimGH/lyrwal2.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/lyrwal2"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/lyrwal2"

  make all -C textwal2

  python -m venv venv

  venv/bin/pip install --upgrade pip
  venv/bin/pip install -r py/requirements.txt
}

package() {
  cd "$srcdir/lyrwal2"

  install -Dm755 lyrwal2.sh \
    "$pkgdir/usr/bin/lyrwal2"

  install -Dm755 textwal2/build/textwal2 \
    "$pkgdir/usr/bin/textwal2"

  install -d "$pkgdir/usr/lib/lyrwal2"
  cp -r py "$pkgdir/usr/lib/lyrwal2/"

  cp -r venv "$pkgdir/usr/lib/lyrwal2/venv"

  install -d "$pkgdir/etc/lyrwal2conf"
  cp -r conf/* "$pkgdir/etc/lyrwal2conf/"


  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

