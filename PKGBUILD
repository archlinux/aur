# Maintainer: Eugene Dvoretsky <radioxoma at gmail com>

pkgname=langmix-git
pkgver=v0.2.r3.g6f9e278
pkgrel=1
pkgdesc="Extract and merge multilingual subtitles into one file"
arch=('any')
url="https://github.com/radioxoma/langmix"
license=('MIT')
groups=()
depends=('python-pysrt')
makedepends=('git' 'python-setuptools')
checkdepends=()
optdepends=('ffmpeg: extract subtitles to SRT')
provides=('langmix')
conflicts=('langmix')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/radioxoma/langmix")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm755 "$srcdir/$pkgname/extractors/langmix-extractsrt.sh" "$pkgdir/usr/bin/langmix-extractsrt"
  install -Dm644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
