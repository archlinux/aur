# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
pkgname=calcure-git
pkgver=r325.ba12ebe
pkgrel=1
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python-holidays' 'python-jalali-core' 'python-jdatetime' 'python-icalendar' 'python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' )
provides=('calcure')
conflicts=('calcure')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}



build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
