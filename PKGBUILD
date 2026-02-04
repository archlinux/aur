# Maintainer: Lewis Donaldson <lewdon0001@gmail.com>
pkgname=lyrwal
pkgver=1.0.0
pkgrel=1
pkgdesc="A program to set the wallpaper to random song lyrics"
arch=('x86_64')
url="https://github.com/ZerimGH/lyrwal"
license=('MIT')
depends=('python' 'freetype2')
makedepends=('make' 'gcc' 'python')
source=("git+https://github.com/ZerimGH/lyrwal.git")
sha256sums=('SKIP')

prepare() {
  rm -rf "$srcdir/lyrwal"

  git clone --recursive https://github.com/ZerimGH/lyrwal.git "$srcdir/lyrwal"

  if [ -d "$srcdir/lyrwal/py" ]; then
    mkdir -p ~/.lyrwal
    cp -r "$srcdir/lyrwal/py" ~/.lyrwal
  else
    echo "Error: 'py' directory not found in the source."
    exit 1
  fi
}

build() {
  make -C "$srcdir/lyrwal/textwal" install
  cd "$srcdir/lyrwal/py"
  make install
}

package() {
  install -Dm755 "$srcdir/lyrwal/lyrwal.sh" "$pkgdir/usr/local/bin/lyrwal"
  chmod +x "$pkgdir/usr/local/bin/lyrwal"
}

clean() {
  rm -rf "$pkgdir"
}


