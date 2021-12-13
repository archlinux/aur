# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : robertfoster


pkgname=cupp-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf '%s.r%s.%s' \
    "$(grep ^__version__ "$_name.py" | sed 's/[^"]\+"\([^"]\+\)"/\1/')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=3.3.0.r77.56547fd
pkgrel=3

pkgdesc='Common User Passwords Profiler'
url="https://github.com/mebus/$_name"
arch=('any')
license=('GPL3')

makedepends=('git')
depends=('python')

changelog=CHANGELOG.md
backup=("etc/$_name.cfg")
source=("git+$url.git")
sha256sums=('SKIP')


build() {
  python -O -m compileall "$_name"
}

package() {
  cd "$_name"
  install -Dm644 {README,CHANGELOG}.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 screenshots/*         -t"$pkgdir/usr/share/doc/$_name/screenshots/"
  install -Dm755 "$_name.py"           -t"$pkgdir/usr/share/$_name/"
  install -Dm644 __pycache__/*         -t"$pkgdir/usr/share/$_name/__pycache__/"
  install -Dm644 "$_name.cfg"          -t"$pkgdir/etc/"
  ln -sv "/etc/$_name.cfg"               "$pkgdir/usr/share/$_name/"
  install -dm755                         "$pkgdir/usr/bin/"
  ln -sv "/usr/share/$_name/$_name.py"   "$pkgdir/usr/bin/$_name"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
